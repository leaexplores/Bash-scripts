# Written by Mathieu Rhéaume
# Location Québec, Canada.
# Date 23 Mars 2011
# Folders were found on macports website and with find(The application).
# Instructions to run : sh uninstall_macports.sh
#!/bin/bash
echo "This script will fully uninstall macports"
echo "**WARNING** Do not run this script if you haven't used the default directories **WARNING**"
read -p "Continue (y/n)?" -n 1
if [[ $REPLY =~ ^[Yy]$ ]]
then
echo "\n Begining uninstall process"
sudo port -f uninstall installed
sudo rm -rf /opt/local
sudo rm -rf /Applications/DarwinPorts
sudo rm -rf /Applications/MacPorts
sudo rm -rf /Library/LaunchDaemons/org.macports.*
sudo rm -rf /Library/Receipts/DarwinPorts*.pkg
sudo rm -rf /Library/Receipts/MacPorts*.pkg
sudo rm -rf /Library/StartupItems/DarwinPortsStartup
sudo rm -rf /Library/Tcl/darwinports1.0
sudo rm -rf /Library/Tcl/macports1.0
sudo rm -rf ~/.macports
else
echo "\n"
fi
