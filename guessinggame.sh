#!/bin/bash

function count_files_dirs_links_in_current_dir {
   echo `find . -type f -o -type d -o -type l -maxdepth 1 | wc -l | egrep -o "[0-9]+"`
}

echo "Guess how many files are in the current directory:"
read user_guess

count_files=$(count_files_dirs_links_in_current_dir)

while [[ ! "$user_guess" =~ ^[0-9]+$ ]]; do
    echo "Wrong input. Enter just a number, no characters"
    read user_guess
done

while [[ ! "$user_guess" -eq "$count_files" ]]; do
    if [[ ! "$user_guess" =~ ^[0-9]+$ ]]; then
        echo "Wrong input. Enter just a number, no characters"
    elif [[ "$user_guess" -lt "$count_files" ]]; then
        echo "Too low. Guess again"
    elif [[ "$user_guess" -gt "$count_files" ]]; then
        echo "Too high. Guess again"
    fi
    read user_guess
done

echo "You guessed it. The current directory contains $count_files files."

