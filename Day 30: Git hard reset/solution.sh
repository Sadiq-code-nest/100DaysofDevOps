
# DAY 30 - Git hard reset
ssh natasha@ststor01
cd /usr/src/kodekloudrepos/demo

git log --oneline
# find and copy hash of commit: "add data.txt file"

git reset --hard <commit-hash>
git push origin master --force

# verify — should show only 2 commits
git log --oneline
