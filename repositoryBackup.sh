#!bin/bash
#cron
git add backupsLog
read YYYY MM DD HH <<<$(date +'%Y %m %d %I')
cd $1
FILE=$(ls -I backup*.tgz | xargs tar -cvzf "backup${YYYY}${MM}${DD}${HH}.tgz")
git add $FILE
updatedb
chmod 777 $FILE
echo "Backup backup${YYYY}${MM}${DD}${HH}.tgz created successfully!" 1>> backupsLog
git commit -m "Auto-backup ${DD}/${MM}/${YYYY}"
echo "Backup backup${YYYY}${MM}${DD}${HH}.tgz comitted to the local git repository" 1>> backupsLog
git push https://$3:$4@$2 --all
echo "Backup backup${YYYY}${MM}${DD}${HH}.tgz pushed to the remote git repository $1" 1>> backupsLog
