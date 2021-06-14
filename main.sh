#!/bin/bash

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=8
BACKTITLE="SM64LBuilder"
TITLE="What to do?"
MENU="Choose one of the following options:"

OPTIONS=(1 "Build"
         2 "Build with a custom repo"
         3 "Remove a repo"
         4 "Replace 2 folders"
         5 "Remove SM64LBuilder"
         6 "Update SM64LBuilder"
         7 "Create a new built in repo"
         8 "Remove a script")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
chmod 755 ~/SM64LBuilder/scripts/builder.sh
cd ~/SM64LBuilder/scripts
./builder.sh $CHOICE
