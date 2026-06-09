
# DAY 32 - Git Rebase
ssh natasha@ststor01
cd /usr/src/kodekloudrepos/official

git config --global user.name "natasha"
git config --global user.email "natasha@kodekloud.com"

git checkout feature
git fetch origin
git rebase origin/master

# if conflicts: edit file → git add → git rebase --continue

git push origin feature --force
