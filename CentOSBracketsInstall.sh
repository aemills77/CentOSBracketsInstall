#!/bin/bash

# CentOSBracketsInstall.sh
# Author: Arthur "Damon" Mills
# Last Update: 06.02.2018
# Version: .1
# License: GPLv3

# Usage: Execute without any arguments

# function declarations

function createicon()
{
local FILE=$1

# creates Brackets icon desktop file
echo "#!/usr/bin/env xdg-open" >> $FILE
echo -e >> $FILE
echo "[Desktop Entry]" >> $FILE
echo "Version=1.0" >> $FILE
echo "Type=Application" >> $FILE
echo "Terminal=False" >> $FILE
echo "Exec=/usr/bin/brackets" >> $FILE
echo "Name=Brackets" >> $FILE
echo "Comment=Desktop Shortcut for Brackets IDE" >> $FILE
echo "Icon=/usr/share/brackets/www/styles/images/brackets_icon.svg" >> $FILE
echo -e >> $FILE

# makes desktop file executable as a program
sudo chmod +x $FILE

return 0 # return createicon
}

# variables
ICONFILE="Brackets.desktop"

# main CentOSBracketsInstall.sh

# installs yum copr plugin and enables external repository
sudo yum -y install yum-plugin-copr
sudo yum -y copr enable mosquito/brackets

# updates yum with all packages
sudo yum -y update

# installs brackets package
sudo yum -y install brackets

# Creates desktop icon file
createicon $ICONFILE

# moves desktop file to user desktop 
mv $ICONFILE /home/$USER/Desktop

exit 0 # end CentOSBracketsInstall.sh
