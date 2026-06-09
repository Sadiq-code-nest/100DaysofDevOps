
# DAY 28 - Git Cherry Pick
ssh natasha@ststor01
cd /usr/src/kodekloudrepos/blog

# Find the target commit hash on feature branch
git checkout feature
git log --oneline
# copy the hash of commit: "Update info.txt"

git checkout master
git cherry-pick <commit-hash>
git push origin master

# verify
git log --oneline
