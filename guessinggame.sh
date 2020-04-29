#!/bin/bash

echo "Guess how many files are in the current directory:"
read user_guess

count_files=`find . -type f -maxdepth 1 | wc -l | egrep -o "[0-9]+"`

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

# TODO verify if user entered a number

