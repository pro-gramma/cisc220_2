#!bin/bash
git clone https://github.com/pro-gramma/cisc220_2.git cisc220_2
read YYYY MM DD HH <<<$(date +'%Y %m %d %I')
FILE=$(tar -cvzf "backup${YYYY}${MM}${DD}${HH}.tgz" $1)
git add FILE
git commit
git push https://$3:$4@github.com/repoURL.git --all
