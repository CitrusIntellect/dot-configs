#!/bin/bash

# Variables
CONFIG_PATH="/home/elias/.config"
FOLDERS=("waybar" "wlogout" "hypr" "wofi" "swaylock" "kitty")
REPO_PATH="/home/elias/automatedBackups/repo"
BRANCH="laptop-configs"  # You can change this branch name as needed

# GitHub repository
REPO_URL="https://github.com/CitrusIntellect/dot-configs"

# Navigate to the local clone of the repo
cd "$REPO_PATH" || exit

# Make sure we're on the correct branch
git checkout "$BRANCH"

# Function to check for changes and push if necessary
check_and_push() {
  folder=$1

  # Copy the folder to the repo
  rsync -av --delete "$CONFIG_PATH/$folder/" "$REPO_PATH/$folder/"

  # Check if there are any changes
  if ! git diff --quiet; then
    echo "Changes detected in $folder, pushing to GitHub..."
    git add "$folder"
    git commit -m "Update $folder configs"
    git push origin "$BRANCH"
  else
    echo "$folder is up to date."
  fi
}

# Loop through each folder
for folder in "${FOLDERS[@]}"; do
  check_and_push "$folder"
done

echo "All folders checked."
