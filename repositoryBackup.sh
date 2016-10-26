#!bin/bash
read YYYY MM DD HH <<<$(date +'%Y %m %d %I')
tar -cvzf "backup${YYYY}${MM}${DD}${HH}.tgz" $1 | git push https://$3:$4@github.com/repoURL.git --all
