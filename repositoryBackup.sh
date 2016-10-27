#!bin/bash
#cron
git clone https://github.com/pro-gramma/cisc220_2.git cisc220_2
read YYYY MM DD HH <<<$(date +'%Y %m %d %I')
git add $(grep -l #cron | tar -cvzf "backup${YYYY}${MM}${DD}${HH}.tgz" $1)
git commit
git push https://$3:$4@github.com/repoURL.git --all
chmod 744
