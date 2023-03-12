#!/bin/bash
#
# Copyright (C) 2024 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Change directory to proprietary blobs
cd ../../../vendor/huawei/mozart/proprietary

# Define the output file
output_file="proprietary-files.txt"

# Delete former output files
rm -f "$output_file"

# Dynamically generate target paths
generate_target_path() {
    local file_path="$1"
    local vendor_path="$2"
    local target_base="/system"
    echo "$file_path" | sed "s|^$vendor_path|$target_base|"
}

# Find and write all blobs, then replace "proprietary" with "$(VENDOR_PATH)"
find ./* -type f ! -name 'extract-files.sh' | while read -r file; do
    relative_path="${file#./}"
    modified_path=$(echo "$relative_path" | sed 's|^|$(VENDOR_PATH)/|')
    target_path=$(generate_target_path "$modified_path" '$(VENDOR_PATH)')
    echo "$modified_path:$target_path \\" >> "$output_file"
done

# Move output file to device tree
mv "$output_file" ../../../../device/huawei/mozart/

# Change directory back to device tree
cd ../../../../device/huawei/mozart/
