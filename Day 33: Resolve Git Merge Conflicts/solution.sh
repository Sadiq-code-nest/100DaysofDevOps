
# DAY 33 - Resolve Git Merge Conflicts
ssh max@ststor01
cd /home/max/story-blog

# Try pushing first to see the conflict
git push origin master

# If rejected: pull with rebase to get latest changes
git pull --rebase origin master

# Open conflicted file and fix it
vi story-index.txt
# Fix content — ensure all 4 story titles are present
# Fix typo: "Mooose" → "Mouse"
# Correct content should be:
# The Lion and the Mouse
# The Fox and the Grapes
# Frogs and the Ox
# The Lion and the Mouse

git add story-index.txt
git rebase --continue

git push origin master
