#!/bin/bash

# Function to link a specific configuration file to the home directory
link_config_file() {
    local SOURCE_PATH="$1"

    # Ensure an argument was provided
    if [ -z "$SOURCE_PATH" ]; then
        echo "Error: No file path provided to link_config_file."
        return 1
    fi

    # Ensure the source file actually exists
    if [ ! -f "$SOURCE_PATH" ]; then
        echo "Error: Source file '$SOURCE_PATH' does not exist."
        return 1
    fi

    # Resolve absolute paths safely
    local ABS_SOURCE
    ABS_SOURCE="$(cd "$(dirname "$SOURCE_PATH")" && pwd)/$(basename "$SOURCE_PATH")"
    local TARGET_LINK="$HOME/$(basename "$SOURCE_PATH")"

    # Check if target already exists or is a symlink
    if [ -e "$TARGET_LINK" ] || [ -L "$TARGET_LINK" ]; then
        # Check if it already points to the correct source
        if [ "$(readlink "$TARGET_LINK")" = "$ABS_SOURCE" ]; then
            echo "Success: $TARGET_LINK is already correctly linked."
        else
            echo "Warning: $TARGET_LINK exists but points elsewhere or is a regular file."
            echo "Skipping: Manual action required for $TARGET_LINK"
            return 1
        fi
    else
        # Create the symlink
        ln -s "$ABS_SOURCE" "$TARGET_LINK"
        echo "Success: Created symlink from $ABS_SOURCE to $TARGET_LINK"
    fi
}

link_config_file ".gitconfig"
link_config_file ".vimrc"