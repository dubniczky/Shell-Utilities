#!/bin/bash

# https://github.com/dubniczky/Shell-Utilities
# List the shell configuration files read by bash


# Print file name if it exists
function show() {
    ls $1 2>/dev/null
}

# Login
show $HOME/.login
show $HOME/.bash_login

# Bashrc
show etc/bashrc
show $HOME/.bashrc

# Profile
show /etc/profile
show $HOME/.profile
show $HOME/.bash_profile

# Profile.d
show /etc/profile.d/*
