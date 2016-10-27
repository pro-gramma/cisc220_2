#!bin/bash
#cron
read YYYY MM DD HH <<<$(date +'%Y %m %d %I')
cd $1
git add $(ls -I backup*.tgz | xargs tar -cvzf "backup${YYYY}${MM}${DD}${HH}.tgz")
git commit -m "Auto-backup ${DD}/${MM}/${YYYY}"
git push origin master
git push https://$3:$4@$2 --all
chmod 777 "backup${YYYY}${MM}${DD}${HH}.tgz"
