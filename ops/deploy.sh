#!/bin/bash
set -e
echo 'Launching deploy script for rhweb2'

SERVER="rhbox.hernihistorie.cz"

ssh -t $SERVER "
    echo 'Please enter password for $USER@$SERVER' &&
    sudo -u deploy -i bash -c '
        cd /var/www/rhweb2/ &&
        git fetch origin $DEPLOY_BRANCH &&
        git reset --hard origin/$DEPLOY_BRANCH &&
        docker build -t haweb .
    ' &&
    sudo systemctl restart haweb.service
    echo Done!
"