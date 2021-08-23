cd %~dp0
cd output

git add .
timeout 1

git commit -m "auto commit"
timeout 1

git push -u origin main
timeout 3