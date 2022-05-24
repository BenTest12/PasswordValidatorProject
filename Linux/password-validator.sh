#!/usr/bin/env bash

# Password validator script
# Version 1

# Pass password as argument for the script
password=$1

# Colors for messages
Green='\033[0;32m'
Red='\033[0;31m'

# Clear screen
clear

# Validate password length.
len="${#password}"

# Testing and validations.
if test $len -ge 10 ; then
    echo "$password" | grep -q [0-9]
    if test $? -eq 0 ; then
      echo "$password" | grep -q [A-Z]
        if test $? -eq 0 ; then
            echo "$password" | grep -q [a-z]
            if test $? -eq 0 ; then
                echo -e "${Green}Strong password (b^_^)b"
                exit 0
            else
                echo -e "${Red}Please include a lower case letter"
            fi
        else
            echo -e "${Red}Please include a capital letter"
        fi
    else
        echo -e "${Red}Please include numbers in your password"
    fi
else
    echo -e "${Red}Password not accepted , Password lenght should be greater than or equal 10"
fi

exit 1