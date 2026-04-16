#!/bin/bash
set -e
echo 'Launching deploy script for rhweb2'

SERVER="rhbox.hernihistorie.cz"
DEPLOY_BRANCH="master"

ssh -t $SERVER "
    echo 'Please enter password for $USER@$SERVER' &&
    sudo -u flask -i bash -c '
        cd /var/www/rhweb2_/rhweb2 &&
        echo Updating code... &&
        git fetch origin $DEPLOY_BRANCH &&
        git reset --hard origin/$DEPLOY_BRANCH
    ' &&
    echo Restarting rhweb2 service...
    sudo systemctl restart rhweb2.service &&
    echo Done!
"