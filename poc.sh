#!/bin/bash
set -e

# clean
rm -rf "__MACOSX" "Build" "za-unzip" "UnzipTest" "ZipArchive.framework"

# unzip framework
# wget "https://github.com/ZipArchive/ZipArchive/releases/download/v2.1.4/ZipArchive.framework.zip"
unzip "ZipArchive.framework.zip" >/dev/null
rm -rf "__MACOSX"
install_name_tool -id "@executable_path/ZipArchive.framework/Versions/A/ZipArchive" "Build/Mac/ZipArchive.framework/Versions/A/ZipArchive"
mv "Build/Mac/ZipArchive.framework" .
rm -rf "Build"

# compile util
make >/dev/null

# 
mkdir -p "UnzipTest/UnZipRoot"
./za-unzip "symlink.zip" "UnzipTest/UnZipRoot"

echo "================================"
ls "UnzipTest"
echo "================================"
ls -al "UnzipTest/UnZipRoot"
echo "================================"

# clean
rm -rf "__MACOSX" "Build" "za-unzip" "UnzipTest" "ZipArchive.framework"
