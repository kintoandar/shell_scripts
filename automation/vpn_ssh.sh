#!/bin/bash

##########################
# blog.kintoandar.com
##########################

REMOTE_ADDR="example.com"
REMOTE_PORT=22

SSH_PRIVATE_KEY="/home/user/.ssh/identity"
LOCAL_IP=172.16.0.2

REMOTE_USER="user"
REMOTE_IP=172.16.0.1

sudo /usr/sbin/pppd nodetach noauth pty "ssh -i $SSH_PRIVATE_KEY $REMOTE_USER@$REMOTE_ADDR -p $REMOTE_PORT 'sudo /usr/sbin/pppd notty noauth $REMOTE_IP:$LOCAL_IP'" $LOCAL_IP:$REMOTE_IP &
