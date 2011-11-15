#!/bin/bash

############################################################################################
# check http://kintoandar.blogspot.com/2011/06/gnome-3-vmware-console-with-vmware-vmrc.html
# for more info on this script
############################################################################################

# Please define this variable with the path to the plugins folder
PATH_TO_VMRC="/home/user/vmware-vmrc-plugin"

export VMWARE_USE_SHIPPED_GTK=yes
cd $PATH_TO_VMRC
./vmware-vmrc > /dev/null 2>&1 &
cd - > /dev/null 2>&1

