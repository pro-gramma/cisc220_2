#!bin/bash
#cron
git add backupsLog
read YYYY MM DD HH <<<$(date +'%Y %m %d %I')
FILE="backup${YYYY}${MM}${DD}${HH}.tgz"
ls -I backup*.tgz | xargs tar -cvzf $FILE
git add $FILE
echo "Backup ${FILE}.tgz created successfully!" 1>> backupsLog
git commit -m "Auto ${FILE}"
echo "Backup ${FILE}.tgz comitted to the local git repository" 1>> backupsLog
updatedb
echo "Backup ${FILE}.tgz pushed to the remote git repository $1" 1>> backupsLog
git push https://$3:$4@$2 --all
