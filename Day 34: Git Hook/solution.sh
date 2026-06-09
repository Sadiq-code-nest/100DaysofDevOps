
# DAY 34 - Git Hook
sudo su - natasha
cd /usr/src/kodekloudrepos/games

git checkout master
git merge feature

# Create post-update hook
cat > .git/hooks/post-update << 'EOF'
#!/bin/bash
while read oldrev newrev ref; do
    branch=$(echo $ref | sed 's|refs/heads/||')
    if [ "$branch" == "master" ]; then
        DATE=$(date +%F)
        git tag -f release-$DATE
    fi
done
EOF

chmod +x .git/hooks/post-update

# Push to trigger the hook
git push origin master

# Verify tag
git tag

# If tag not auto-created, create manually
DATE=$(date +%F)
git tag release-$DATE
git push origin --tags
