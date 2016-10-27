#!bin/bash
#cron
read YYYY MM DD HH <<<$(date +'%Y %m %d %I')
git add $(ls -I backup*.tgz | xargs tar -cvzf "backup${YYYY}${MM}${DD}${HH}.tgz" $1)
git commit
git push https://$3:$4@$2 --all
