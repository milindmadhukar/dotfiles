#!/bin/bash

# List all network connections, pipe to fzf for selection
connection=$(nmcli -t -f TYPE,UUID,NAME con | fzf)

# Check if a connection was selected
if [[ -z "$connection" ]]; then
  echo "No connection selected. Exiting."
  exit 1
fi

# Extract UUID from the selected connection
uuid=$(echo "$connection" | cut -d: -f2)

# Confirm deletion
read -p "Are you sure you want to delete the connection with UUID $uuid? (y/n): " confirm
if [[ "$confirm" != "y" ]]; then
  echo "Operation canceled."
  exit 1
fi

# Delete the connection
sudo nmcli c delete "$uuid"

# Check if the command succeeded
if [[ $? -eq 0 ]]; then
  echo "Connection deleted successfully."
else
  echo "Failed to delete the connection."
fi
