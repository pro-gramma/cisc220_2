#!bin/bash
#cron
read YYYY MM DD HH <<<$(date +'%Y %m %d %I')
cd $1
git add $(ls -I backup*.tgz | xargs tar -cvzf "backup${YYYY}${MM}${DD}${HH}.tgz")
echo "Backup backup${YYYY}${MM}${DD}${HH}.tgz created successfully!" 1>> backupsLog
git commit -m "Auto-backup ${DD}/${MM}/${YYYY}"
updatedb
echo "Backup backup${YYYY}${MM}${DD}${HH}.tgz comitted to the local git repository" 1>> backupsLog
git push https://$3:$4@$2 --all
echo "Backup backup${YYYY}${MM}${DD}${HH}.tgz pushed to the remote git repository $1" 1>> backupsLog
