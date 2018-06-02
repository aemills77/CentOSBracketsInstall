#!/bin/bash

# CentOSBracketsInstall.sh
# Author: Arthur "Damon" Mills
# Last Update: 06.02.2018
# Version: .1
# License: GPLv3

# Usage: Execute without any arguments

# Note: At time of writing script the following are offline:
# jgillich/brackets
# mosquito/brackets
# script uses wget to pull latest rpm from pkgs.org

# function declarations

function createicon()
{
    local FILE=$1   # desktop icon file name

    # creates Brackets icon desktop file
    echo "#!/usr/bin/env xdg-open" > $FILE
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

    return 0        # return createicon
}

# variables
ICONFILE="Brackets.desktop"

# main CentOSBracketsInstall.sh

# installs yum copr plugin and enables external repository
# DEPRICATED: repository is offline
#sudo yum -y install yum-plugin-copr
#sudo yum -y copr enable mosquito/brackets

# uses wget to download latest brackets rpm
wget http://li.nux.ro/download/nux/dextop/el7/x86_64/brackets-1.7.0-1.el7.nux.x86_64.rpm
sudo rpm -Uvh --force brackets-1.7.0-1.el7.nux.x86_64.rpm

# updates yum and installs brackets
sudo yum -y update
sudo yum -y install brackets

# Creates desktop icon file
createicon $ICONFILE

# clean up: moves icon file to desktop, deletes rpm 
mv $ICONFILE /home/$USER/Desktop
rm brackets-1.7.0-1.el7.nux.x86_64.rpm

exit 0 # end CentOSBracketsInstall.sh
