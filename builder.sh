cd scripts
if [ -e $1.sh ]; then
echo $1 "found! Cloning the repo..."
chmod 755 $1.sh
sh $1.sh
else
echo $1 "not found!"
fi

