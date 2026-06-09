
# DAY 31 - Git Stash
ssh natasha@ststor01
cd /usr/src/kodekloudrepos/news

git stash list              # see available stashes
git stash apply stash@{1}  # restore specific stash

git add .
git commit -m "Restored stash@{1} changes"
git push origin master
