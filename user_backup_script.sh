
#!/bin/bash

# A simple script to manage users and back up directories

echo "Choose an option:"
echo "1. Add User"
echo "2. Delete User"
echo "3. Backup Directory"
read -p "Enter your choice [1-3]: " choice

if [ "$choice" == "1" ]; then
    read -p "Enter username to add: " username
    if id "$username" &>/dev/null; then
        echo "User already exists."
    else
        sudo useradd -m "$username"
        echo "User $username added."
    fi

elif [ "$choice" == "2" ]; then
    read -p "Enter username to delete: " username
    if id "$username" &>/dev/null; then
        sudo userdel -r "$username"
        echo "User $username deleted."
    else
        echo "User does not exist."
    fi

elif [ "$choice" == "3" ]; then
    read -p "Enter directory to back up: " dir
    read -p "Enter destination backup file (e.g. /home/backup.tar.gz): " backup_file
    if [ -d "$dir" ]; then
        tar -czvf "$backup_file" "$dir"
        echo "Backup complete: $backup_file"
    else
        echo "Directory does not exist."
    fi

else
    echo "Invalid choice."
fi

