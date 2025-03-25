// Compile: 
// g++  libzipplayground.cpp  -I<path to libzip include> libarchive-rw.a   -lz 
#include <iostream>
#include <string>
#include <vector>
#include <zip.h>
#include <cstdlib>
#include <cstring>
#include <fstream>
#include <filesystem>
using namespace std;


int main () {

    std::vector<std::string> record_paths = {"/mnt/elements/shit/data/record1", "/mnt/elements/shit/data/record2"};

    std::string zip_filepath = "/var/tmp/output.zip";

    int error = 0;
    zip_t* zip = zip_open(zip_filepath.c_str(), ZIP_CREATE | ZIP_TRUNCATE, &error);
    if (!zip) {
        std::cout << "Failed to open file: " << std::endl;
    }

    for (const auto& record_path_str : record_paths) 
    {
        std::cout << "path str: " << record_path_str << std::endl;

        std::filesystem::path record_path(record_path_str);

        std::string record_dir_name = record_path.filename().string();

        for (const auto& entry : std::filesystem::recursive_directory_iterator(record_path)) 
        {
            if (std::filesystem::is_regular_file(entry.path())) 
            {
                std::filesystem::path relative_path = std::filesystem::relative(entry.path(), record_path.parent_path());
                std::string zip_entry_name = relative_path.generic_string();

                std::cout << "zip_entry_name: " << zip_entry_name << std::endl;

                std::ifstream input(entry.path(), std::ios::binary);
                if (!input) {
                    std::cout << "Failed to open file: " << entry.path();
                    continue;
                }

                std::string file_path_str = entry.path().string();
                zip_source_t* source = zip_source_file(zip, file_path_str.c_str(), 0, -1);
                if (source == nullptr) {
                    std::cerr << "Failed to create zip source for: " << file_path_str 
                              << " (" << zip_strerror(zip) << ")" << std::endl;
                    continue;
                }

                zip_int64_t idx = zip_file_add(zip, zip_entry_name.c_str(), source, ZIP_FL_OVERWRITE | ZIP_FL_ENC_UTF_8);

                if (idx < 0) {
                    std::cout << "Error adding " << zip_entry_name << " to archive " << zip_strerror(zip) << std::endl;
                    zip_source_free(source);
                }else {
                    if (zip_set_file_compression(zip, idx, ZIP_CM_STORE, 0) < 0) {
                        std::cerr << "Error disabling compression for " << zip_entry_name
                                    << ": " << zip_strerror(zip) << std::endl;
                    }
                }
            
            }
        }
    }

    if (zip_close(zip) < 0) {
        std::cout << "Error closing zip archive. " << std::endl;
    } 

  return 0;
}