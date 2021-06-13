cd ~/SM64LBuilder/repos
git clone https://github.com/sm64pc/sm64ex.git
echo "Please select your baserom.us.z64."
cp $(zenity --file-selection --file-filter='z64 ROMS (z64) | *.z64' --title="Select your baserom.us.z64 ROM") sm64ex
cd sm64ex
echo "Chose a model pack"
PACK=$(zenity --list --column Packs none render96modelpack)
chmod 755 ~/SM64LBuilder/model-packs/$PACK.sh
sh ~/SM64LBuilder/model-packs/$PACK.sh sm64ex
echo "Would you like patches? [y/n]"
read answer
if [ $answer = "y" ]; then
echo "How many?"
read number
for i in {1..$number}; do echo "Chose a file" && git apply $(zenity --file-selection --file-filter='patch files (patch) | *.patch' --title="Select your patch file"); done
fi
echo "Starting compilation of sm64ex..."
if [ $1 == "--jobs" ]; then
make $(zenity --forms --title="Build Flags" --add-entry=Flags) $2
else
make $(zenity --forms --title="Build Flags" --add-entry=Flags)
fi
echo "sm64ex compiled!"
