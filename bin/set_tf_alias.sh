#!/usr/bin/env bash

# Define the alias command
alias_command='alias tf="terraform"'

# Check if .bash_profile exists and append the alias command
if [ -f "$HOME/.bash_profile" ]; then
    # Check if the alias is already present
    if grep -qxF "$alias_command" "$HOME/.bash_profile"; then
        echo "Alias 'tf' for 'terraform' already exists in .bash_profile."
    else
        echo "$alias_command" >> "$HOME/.bash_profile"
        echo "Alias 'tf' for 'terraform' has been added to .bash_profile."
    fi
else
    echo "The .bash_profile does not exist in your home directory."
fi
