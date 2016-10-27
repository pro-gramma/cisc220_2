#!bin/bash
#cron
read YYYY MM DD HH <<<$(date +'%Y %m %d %I')
cd $1
FILE=$(ls -I backup*.tgz | xargs tar -cvzf "backup${YYYY}${MM}${DD}${HH}.tgz")
git add FILE
git commit -m "Auto-backup ${DD}/${MM}/${YY}"
git push https://$3:$4@$2 --all
