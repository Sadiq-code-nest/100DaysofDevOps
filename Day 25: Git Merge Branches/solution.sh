
# DAY 25 - Git Merge Branches
ssh natasha@ststor01
cd /usr/src/kodekloudrepos/demo

git checkout -b devops
cp /tmp/index.html .
git add index.html
git commit -m "Added index.html in devops branch"
git push origin devops

git checkout master
git merge devops
git push origin master
