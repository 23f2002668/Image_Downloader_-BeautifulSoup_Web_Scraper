#!/usr/local/bin/bash
# Explaination at bottom


# Clear the entire terminal
clear

# Taking files as input
echo
file1=$(osascript -e 'POSIX path of (choose file with prompt "Select First File to Merge")')  
if [[ $file1 == "" ]]; then
    exit
fi

ext1=$(echo "$file1" | awk -F'.' '{print $NF}')
echo -e "\nFirst File :  $file1"

file2=$(osascript -e 'POSIX path of (choose file with prompt "Select Second File to Merge")') 
if [[ $file2 == "" ]]; then
    exit
fi
ext2=$(echo "$file1" | awk -F'.' '{print $NF}')
echo -e "\nSecond File : $file2"


# Get merged filename and path
echo
read -p "Enter merged file name : " filename
path=$(osascript -e 'POSIX path of (choose folder with prompt "Select Path to Merged File")') 2> /dev/null

if [[ "$path" == "" ]]; then
    echo -e "\nImportant : Please select folder to save merged file."
    path=$(osascript -e 'POSIX path of (choose folder with prompt "Select Path to Merged File")') 2> /dev/null
fi

if [[ "$path" == "" ]]; then
    echo -e "\nOperation failed : You have not selected the folder to save merged file.\n" 
    exit
fi


# Merging file when both files have same extensions
if [[ "$ext1" == "$ext2" ]]; then
    if [[ "$filename" == "" ]]; then
        filename="$pathMerged.$ext1"
    else        
        filename="$path$filename.$ext1"
    fi

    echo "file '$file1'" > "./input.txt"
    echo "file '$file2'" >> "./input.tx"t
    echo -e "\nStart merging videos . . .\n"

    ffmpeg -f concat -safe 0 -i "./input.txt" -c copy "$filename" > /dev/null 2>&1

    if [[ $? != 0 ]]; then
        echo -e "\nOperation failed : The files cannot be merged due to an error."
        exit
    fi

    echo -e "\nThe videos have been merged successfully !\n"
    read -p "Do you want to remove both input videos (Y/n) : " cond

    if [[ "$cond" == "Y" || "$cond" == "y" ]]; then
        rm -f "$file1" "$file2"
        echo -e "\nBoth input videos have successfully removed !\n"
    fi

    rm -f "input.txt"    
    open "$filename"
    exit
fi

# Merging file when both files have different extensions
if [[ "$filename" == "" ]]; then
    filename="$pathMerged.$ext1"
else
    filename="$path$filename.mp4"
fi 

ffmpeg -i "$file1" -i "$file2" -filter_complex "[0:v:0][0:a:0][1:v:0][1:a:0]concat=n=2:v=1:a=1[outv][outa]" -map "[outv]" -map "[outa]" "$filename" > /dev/null 2>&1

if [[ $? != 0 ]]; then
    echo -e "\nOperation failed : The files cannot be merged due to an error." 
    exit
fi

echo -e "\nThe videos have been merged successfully !\n"
read -p "Do you want to remove both input videos (Y/n) : " cond

if [[ "$cond" == "Y" || "$cond" == "y" ]]; then
   rm -f "$file1" "$file2"
   echo -e "\nBoth input videos have successfully removed !\n"
fi

rm -f "input.txt"
open "$filename"
exit
fi

# Explaination :-

# 🔸 POSIX path of (. . .)                --->    Converts the Mac style path into Unix style POSIX - form so that it can be used by terminal
# 🔸 choose file "Message"                --->    Open file dialogue but not show any message at the top of the dialogue
# 🔸 choose file with prompt "Message"    --->    Open file dialogue and show the message at the top of the dialogue

# Kurulus Osman Episode 91+92
