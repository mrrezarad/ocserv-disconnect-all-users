#!/bin/bash

#Get Users list
users=$(sudo occtl show users | awk '{print $2}' | grep -E '^[0-9]+$')

#Disconnect Users
for user in $users; do
    sudo occtl disconnect user $user
done