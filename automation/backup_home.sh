#!/bin/bash

# Backup cherry picked files to a encrypted tar.gz file using gpg

##########################
# kintoandar.blogspot.com
##########################

set -vx

######## Define variables

# backup destination path
BKUP="/opt/backups/"
# home path
HOME="/home/kintoandar"
# file with the password
PASSWD_FILE="/home/kintoandar/documents/password"
# backup file name variable
VAR=`date -I`_mybox

####### Backup /etc

sudo tar -zc /etc | gpg -c --batch --no-tty --always-trust --passphrase-file $PASSWD_FILE > $BKUP/$VAR-etc.tar.gz.gpg
logger tar.gz ==\> ...etc saved

####### Backup user /home

tar -zc \
        $HOME/.bash* \
        $HOME/.conkyrc \
        $HOME/.config/google-chrome \
        $HOME/Desktop \
        $HOME/documents \
        $HOME/.gconf/apps/gnome-terminal \
        $HOME/.gconf/apps/virt-manager \
        $HOME/.gconf/apps/evolution \
        $HOME/.gtk-bookmarks \
        $HOME/.git* \
        $HOME/.gnupg \
        $HOME/.libreoffice \
        $HOME/.config/gnote \
        $HOME/.config/tomboy \
        $HOME/.mutt* \
        $HOME/.pki \
        $HOME/.purple \
        $HOME/.screenrc \
        $HOME/scripts \
        $HOME/.Skype \
        $HOME/.ssh \
        $HOME/.vim* \
        $HOME/.gnome2/keyrings \
        $HOME/mount \
        $HOME/install \
        $HOME/blip \
        $HOME/.config/evolution \
        $HOME/.local/share \
        $HOME/.thunderbird \
        $HOME/.subversion \
        $HOME/.remmina \
        $HOME/.chef \
        $HOME/.cdargs* \
        $HOME/.visualvm* \
        $HOME/vagrants \
        $HOME/.fonts \
        $HOME/.config/gtk-3.0 \
        $HOME/.config/parcellite \
        --ignore-failed-read \
        --exclude='*/Cache/*' \
        --exclude='*/Steam/*' \
        --exclude='*.lck' \
        --exclude='*.lock' \
        --exclude='*.tmp' \
        --exclude='*.temp' \
        --exclude='*/Crash\ Reports/*' \
        --exclude="$HOME/blip/subversion/*" \
        | gpg -c --batch --no-tty --always-trust --passphrase-file $PASSWD_FILE > $BKUP/$VAR-home.tar.gz.gpg

####### Log stuff

logger tar.gz ==\> ...home saved
echo "Backup Complete"
ls -lah $BKUP/* >> $HOME/Desktop/backup.log
echo -e "\n-----------------------\n" >> $HOME/Desktop/backup.log
du -skh $BKUP/ >> $HOME/Desktop/backup.log
