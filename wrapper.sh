#!/bin/bash

SCRIPTS_FOLDER="script"  # Specify the folder path where the scripts are located
LOG_FILE="execution.log"  # Specify the log file name

# Find all script files in the specified folder
script_files=$(find "$SCRIPTS_FOLDER" -type f -name "*.sh")

# Create or truncate the log file
> "$LOG_FILE"

for script_file in $script_files; do
    echo "##################################################"
    echo "Executing script: $script_file"
    echo "--------------------------------------------------"
    
    # Execute the script and capture the output
    output=$(bash "$script_file" 2>&1)
    echo "$output"
    
    # Save the output to the log file
    echo "##################################################" >> "$LOG_FILE"
    echo "Executing script: $script_file" >> "$LOG_FILE"
    echo "--------------------------------------------------" >> "$LOG_FILE"
    echo "$output" >> "$LOG_FILE"
    echo >> "$LOG_FILE"
done

