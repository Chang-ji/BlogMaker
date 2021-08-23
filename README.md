## Chang-ji.github.io 에 올리는 법
1. GitHubPageMaker 빌드 
   > bundle exec jekyll serve
2. output 파일 github 연결(초기)
   > cd output
   > git init
   > git add .
   > git commit -m "first commit"
   > git branch -M main
   > git remote add origin https://github.com/Chang-ji/Chang-ji.github.io.git
   > git pull origin main
   > cd ..
   > bundle exec jekyll serve
   > cd output
   > git push -u origin main
2. output 파일 github 연결(한번 연결 이후)
   > cd output
   > git add .
   > git commit -m "second commit"
   > git pull origin main
   > cd ..
   > bundle exec jekyll serve
   > cd output
   > git push -u origin main
3. 자동 배포 파일 추가
   > start AutoDeploy.bat