#!/bin/bash

# Define paths
LOCAL_CONFIG="$(pwd)/.gitconfig"
TARGET_LINK="$HOME/.gitconfig"

# 1. Check if the local source file exists
if [ ! -f "$LOCAL_CONFIG" ]; then
    echo "Error: No .gitconfig file found in the current directory."
    echo "Please run this script from the folder containing your source .gitconfig."
    exit 1
fi

# 2. Check if ~/.gitconfig already exists
if [ -e "$TARGET_LINK" ] || [ -L "$TARGET_LINK" ]; then
    echo "Notice: $TARGET_LINK already exists."
    
    # Check if it is already a symlink pointing to our local file
    if [ "$(readlink "$TARGET_LINK")" = "$LOCAL_CONFIG" ]; then
        echo "Success: It is already correctly linked to this directory."
    else
        echo "Warning: It exists but points elsewhere or is a regular file."
        echo "Manual action required: Back up and remove $TARGET_LINK first."
    fi
else
    # 3. Create the symlink since ~/.gitconfig does not exist
    ln -s "$LOCAL_CONFIG" "$TARGET_LINK"
    echo "Success: Created symlink from $LOCAL_CONFIG to $TARGET_LINK"
fi
