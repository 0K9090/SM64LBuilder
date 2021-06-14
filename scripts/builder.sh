if [ $1 == "7" ]; then
  chmod 755 ~/SM64LBuilder/scripts/create-new-repo.sh
  sh ~/SM64LBuilder/scripts/create-new-repo.sh
else
if [ $1 == "6" ]; then
cp -r repos ~
BLUE='\033[0;34m'
echo -e "${BLUE}Clone the github again and then run ./builder.sh --replace. First select the repos folder in ~/SM64LBuilder and then select ~/repos\n"
cd ~
rm -rf SM64LBuilder
else
if [ $1 == "4" ]; then
echo "Replace what?"
rm -rf $(zenity --file-selection --directory)
echo "What to replace it with?"
cp -r $(zenity --file-selection --directory) ~/SM64LBuilder
else
if [ $1 == "5" ]; then
BLUE='\033[0;34m'
echo -e "${BLUE}ARE YOU SURE YOU WANT TO REMOVE SM64LBUILDER? THIS ACTION CANNOT BE UNDONE. [y/n]"
read answer
if [ $answer == "y" ]; then
echo "Removing SM64LBuilder... Bye..."
cd ~
rm -rf SM64LBuilder
fi
else
if [ $1 == "3" ]; then
cd ~/SM64LBuilder/repos
echo "Select a repo to remove."
rm -rf $(zenity --list --column Repos $(ls))
else
  if [ $1 == "8" ]; then
  cd ~/SM64LBuilder/scripts
  echo "Select a script to remove."
  rm $(zenity --list --column Scripts $(ls))
  else
if [ $1 == "2" ]; then
cd repos
LINK=$(zenity --forms --add-entry=Github-Clone-Link)
FOLDER=$(zenity --forms --add-entry=repo-folder-name)
git clone $LINK
 echo "Please select your baserom.us.z64."
cp $(zenity --file-selection --file-filter='z64 ROMS (z64) | *.z64' --title="Select your baserom.us.z64 ROM") $FOLDER
cd $FOLDER
echo "Would you like patches? [y/n]"
read answer
if [ $answer = "y" ]; then
echo "How many?"
read number
for i in {1..$number}; do echo "Chose a file" && git apply $(zenity --file-selection --file-filter='patch files (patch) | *.patch' --title="Select your patch file"); done
fi
echo "Starting compilation of $FOLDER... "
IN=$(zenity --list --checklist --title "Build Flags" --text "Flags" --column "" --column "Options" True VERSION=us False VERSION=eu False VERSION=jp False VERSION=sh False TARGET_BITS=32 True TARGET_BITS=64 False TARGET_RPI=1 False TARGET_WEB=1 False WINDOWS_BUILD=1 False OSX_BUILD=1 WINDOWS_CONSOLE=1 DEBUG=1 BETTERCAMERA=1 NODRAWINGDISTANCE=1 TEXTURE_FIX=1 EXT_OPTIONS_MENU=1 EXTERNAL_DATA=1 DISCORDRPC=1 TEXTSAVES=1)
make $(echo $IN | tr "|" " ")
echo $FOLDER "compiled!"
else
REPO=$(zenity --list --column Repos sm64ex sm64ex-coop sm64ex-alo sm64 render96ex moon64)
/bin/echo -e "You selected $REPO"
cd ~/SM64LBuilder/scripts
  chmod 755 $REPO.sh
  sh $REPO.sh
fi
fi
fi
fi
fi
fi
fi
