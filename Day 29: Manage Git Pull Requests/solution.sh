
# DAY 29 - Manage Git Pull Requests
# UI task in Gitea — no terminal needed (after verifying repo state)

# 1. Login to Gitea as max / Max_pass123
# 2. Pull Requests → New Pull Request
#    Source: story/fox-and-grapes  →  Destination: master
#    Title: Added fox-and-grapes story
#    Click: Create Pull Request
# 3. Add reviewer: Reviewers → Add → tom
# 4. Logout, login as tom / Tom_pass123
# 5. Open PR → Review → Approve → Merge

# Optional: verify on storage server
ssh max@ststor01
cd ~/   # find repo folder
git log --oneline
