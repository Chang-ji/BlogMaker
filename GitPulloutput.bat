cd %~dp0
cd output

git add .
timeout 1

git commit -m "auto commit"
timeout 1

git pull origin main
timeout 1
cd ..

bundle exec jekyll build



