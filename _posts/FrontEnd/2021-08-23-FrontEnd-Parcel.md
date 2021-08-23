---
layout: post
current: post
cover: assets/built/images/fables.jpg
navigation: True
title: Parcel
date: 2021-08-23 07:02:00
tags: [FrontEnd]
class: post-template
subclass: 'post'
author: Chanji
---
{% include FrontEnd-table-of-contents.html %}

# Parcel 프로젝트 만들기

## ***프로젝트 생성 github 주소***
https://github.com/Chang-ji/Parcel-example

### 참고 자료
https://heropy.blog/

### <span style="color:gray"><u>package.json</u> 파일 생성</span>
```
npm init -y
```

### <span style="color:gray"><u>package.json</u> parcel-bundler 설치</span>
```
npm i -D parcel-bundler
```

### <span style="color:gray"><u>package.json</u> 파일에 <u>scripts</u> 부분 변경</span>
```javascript
  "scripts": {
    "dev": "parcel index.html",
    "build": "parcel build index.html"
  },
```
### <span style="color:gray">scss 추가</span>
```html
  <link rel="stylesheet" href="./scss/main.scss">
```

### <span style="color:gray">javascript 추가</span>
```html
<script defer src="./js/main.js"></script>
```
### <span style="color:gray">reset.css cdn 추가</span>

```html
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
```

### <span style="color:gray">favicon 파일 만들기</span>
- `파비콘 만들기` : https://www.icoconverter.com/

### <span style="color:gray">정적 파일 연결</span>
- `정적파일연결` : https://www.npmjs.com/package/parcel-plugin-static-files-copy 
```bash
npm install -D parcel-plugin-static-files-copy
```

#### <span style="color:gray"><u>package.json</u> 파일에 추가</span>
```json
"staticFiles": {
    "staticPath": "static"
}
```

### <span style="color:gray">postcss autoprefixer 설치</span> 
```bash
npm i -D postcss autoprefixer
```
#### <span style="color:gray"><u>package.json</u> 파일에 추가</span>
```json
  "browserslist": [
    ">1%",
    "last 2 versions"
  ]
```

### <span style="color:gray">.postcssrc.js 작성</span>
```javascript
//import
const autoprefixer = require('autoprefixer')

// export
module.exports = {
  plugins: [
    autoprefixer
  ]
}
```

### <span style="color:gray">Error: PostCSS plugin autoprefixer requires PostCSS 8.</span>
- autoprefixer 10버전에서 8버전으로 다운그레이드
https://stackoverflow.com/questions/64057023/error-postcss-plugin-autoprefixer-requires-postcss-8-update-postcss-or-downgra
```bash
npm i -D autoprefixer@9
```


## ***Babel***
https://en.wikipedia.org/wiki/Babel_(transcompiler)

- ES6, ES7, ES8 을 ES5로 변환(compile)
```bash
npm i -D @babel/core @babel/preset-env
```
### <span style="color:gray">.babelrc.js 파일 생성</span>
```javascript
module.exports = {
  presets:['@babel/preset-env']
}
```

### <span style="color:gray">Promise 객체 적용 안되는 문제 해결</span>
```bash
npm i -D @babel/plugin-transform-runtime
```
#### <span style="color:gray">.babelrc.js 플러그인 추가</span>
```javascript
module.exports = {
  presets:['@babel/preset-env'],
  plugins:[
    ['@babel/plugin-transform-runtime']
  ]
}
```

## ***Parcel***
https://ko.parceljs.org/  
https://ko.parceljs.org/cli.html  

## ***github 관리***
```git
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/Chang-ji/Parcel-example.git
git push -u origin main
```

