
# DAY 26 - Git Manage Remotes
ssh natasha@ststor01
cd /usr/src/kodekloudrepos/games

git checkout master
git remote add dev_games /opt/xfusioncorp_games.git

cp /tmp/index.html .
git add index.html
git commit -m "Added index.html file"
git push dev_games master

# verify
git remote -v
