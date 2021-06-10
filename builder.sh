if [ $1 == "--help" ]; then
echo "Commands: --help = see this help message, --library = see the built in repos, --custom-repo = build with a custom repo"
else
if [ $1 == "--library" ]; then
cd ~/SM64LBuilder/scripts
ls
cd ~/SM64LBuilder
else
if [ $1 == "--custom-repo" ]; then
cd repos
git clone $2
  if [ -e ~/baserom.us.z64 ]; then
  cp ~/baserom.us.z64 $3
  cd $3
  echo "Starting compilation of $3... (build flags and jobs are not available right now.) "
  make
  echo $3 "compiled!"
  else
  cd ~/SM64LBuilder/repos
  rm $3
  echo "baserom.us.z64 not found in home directory. Please put your baserom into your home directory."
  fi
else
cd scripts
if [ -e $1.sh ]; then
echo $1 "found! Cloning the repo..."
chmod 755 $1.sh
sh $1.sh
else
if [ $1 == "" ]; then
echo "No arguments specified. Run --help to see avialable arguments"
else
echo $1 "not found!"
fi
fi
fi
fi
fi

