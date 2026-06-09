
# DAY 27 - Git Revert Some Changes
ssh natasha@ststor01
cd /usr/src/kodekloudrepos/ecommerce

git checkout master
git log --oneline   # note the HEAD commit hash

# Revert HEAD — this opens editor, change first line to: revert ecommerce
git revert HEAD

# verify
git log --oneline
git push origin master
