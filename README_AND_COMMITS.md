# README — replace "64–67 Coming soon" row with these rows in Module 4:

| [64](./Day%2064:%20Fix%20Python%20App%20Deployed%20on%20Kubernetes%20Cluster/) | Fix Python App Deployed on Kubernetes Cluster | ImagePullBackOff, wrong image, targetPort fix | ✅ |
| [65](./Day%2065:%20Deploy%20Redis%20Deployment%20on%20Kubernetes/) | Deploy Redis Deployment on Kubernetes | ConfigMap as volume, emptyDir, CPU request | ✅ |
| 66–67 | Coming soon | | 🔜 |


---
# GIT COMMANDS — one commit per day

cd ~/100DaysofDevOps

cp -r ~/days64-65/Day\ 64* .
cp -r ~/days64-65/Day\ 65* .

git add "Day 64: Fix Python App Deployed on Kubernetes Cluster"
git commit -m "Add Day 64: Fix Python App Deployed on Kubernetes Cluster"

git add "Day 65: Deploy Redis Deployment on Kubernetes"
git commit -m "Add Day 65: Deploy Redis Deployment on Kubernetes"

git add README.md
git commit -m "Update README tracker: add days 64-65, badge updated to 65/100"

git push origin main
