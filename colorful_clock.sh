#!/bin/bash

# Array of colors
colors=(1 2 3 4 5 6)

# Function to display the clock
display_clock() {
  while true; do
    clear
    # Get the current date and time in 12-hour format
    current_time=$(date +"%Y-%m-%d %I:%M:%S %p")

    # Check if the date command is working
    if [ -z "$current_time" ]; then
      echo "Error: Unable to fetch the current date and time."
      exit 1
    fi

    # Pick a random color from the array
    color=${colors[$RANDOM % ${#colors[@]}]}

    # Set color using tput
    tput setaf $color
    tput bold

    # Display the date and time
    echo "Current Date and Time:"
    echo "$current_time"

    # Reset text formatting
    tput sgr0

    # Wait for 1 second before updating the clock
    sleep 1
  done
}

# Run the clock display function
display_clock

