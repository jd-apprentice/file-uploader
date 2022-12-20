#!/bin/bash

##
# Bash script that uploads a file to AnonFiles
##

function ask_file() {
    echo ""
	echo -ne "Give the path to your file\n-> "
    read file
}

function upload_file() {
    echo ""
    ask_file
    curl -F "file=@$file" https://api.anonfiles.com/upload | jq . > response.json
    chmod +x ./main.py
    echo "Your file is uploaded successfully, here is the url: \n-> "
    ./main.py
    echo "Link opened in your browser"
    echo ""
}

function about() {
    echo ""
    echo "Thanks to AnonFiles for their host"
    echo "Contribute to their project here -> https://anonfiles.com/contribute"
    echo "My github -> https://github.com/jd-apprentice"
    echo ""
}

##
# Color  Variables
##

green='\e[32m'
blue='\e[34m'
clear='\e[0m'

##
# Color Functions
##

ColorGreen(){
	echo -ne $green$1$clear
}
ColorBlue(){
	echo -ne $blue$1$clear
}

##
# Menu Functions
##

menu(){
echo -ne "

     \                          ____| _)  |             
    _ \    __ \    _ \   __ \   |      |  |   _ \   __| 
   ___ \   |   |  (   |  |   |  __|    |  |   __/ \__ \ 
 _/    _\ _|  _| \___/  _|  _| _|     _| _| \___| ____/ 


$(ColorGreen '1)') Upload file
$(ColorGreen '2)') About
$(ColorGreen '0)') Exit
$(ColorBlue 'Choose an option:') "
        read a
        case $a in
	        1) upload_file ; menu ;;
	        2) about ; menu ;;
		    0) exit 0 ;;
		    *) echo -e $red"Wrong option."$clear; WrongCommand;;
        esac
}

# Call the menu function
menu
