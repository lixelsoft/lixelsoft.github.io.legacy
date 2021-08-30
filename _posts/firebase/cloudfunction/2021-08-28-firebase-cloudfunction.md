---
title: Firebase CloudFunction 시작하기
author: lixelsoft
date: 2021-08-29 01:00:00 +09:00
categories: [Firebase, CloudFunction]
tags: [firebase, cloudfunction] 
math: true
mermaid: true
---


# Install

```bash
# firebase cli 설치.
$ npm install -g firebase-tools
# 구글 계정으로 로그인.
$ firebase login
# 새로운 프로젝트 폴더를 생성하고 해당 폴더로 이동.
$ mkdir Test && cd ./Test
# 해당 프로젝트 폴더에서 firebase initialize를 해준다.
$ firebase init
```


* 아래와 같이 어떤 features를 선택할지 정해주는 메뉴가 나오는데 여기서 `Functions`를 선택해준다.<br/>
  주의할 점은 `스페이스바`로 선택을 해주고 `엔터키`로 넘어가줘야함<br/>
![image](https://user-images.githubusercontent.com/56714476/131238987-dd144a55-dd60-4bd8-a684-ade1ba68e71b.png)
* 다음으로 프로젝트를 선택해주고 나머지 질문에 자신에게 맞는 설정을 선택해주면 된다.<br>
![image](https://user-images.githubusercontent.com/56714476/131239034-fb4dd6be-a31e-45a9-8462-9894ef6a88df.png)



# Usage
* 설치가 완료되고 나면 여러 파일들이 생성이 되는데 이중에서 `functions/index.js` 파일을 오픈해 준다.<br>
  코드에서 `"exports.helloWorld"` 이 부분이 예제코드라고 할 수 있는데 이 부분을 주석해제 시켜 준다.

```js
const functions = require("firebase-functions");

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
exports.helloWorld = functions.https.onRequest((request, response) => {
  functions.logger.info("Hello logs!", {structuredData: true});
  response.send("Hello from Firebase!");
});
```

* 로컬에서 테스트를 진행하려면 아래 명령어를 입력하면 된다.
  서버에 올리기 전에 먼저 로컬에서 테스트 후 올려보는것이 좋다.
```bash
$ firebase serve
```
![image](https://user-images.githubusercontent.com/56714476/131240532-8f7f0164-c38a-40f4-9da5-a72ce5f7d020.png)
* 명령어를 실해하고 나면 해당 함수를 테스트해볼 수 있는 링크가 생성이 된다.<br>
  해당 링크를 클릭해보면 아래와 같이 정상적으로 함수가 실행되는 것을 알 수 있다.
![image](https://user-images.githubusercontent.com/56714476/131240596-08d1c6d5-810b-4b85-b48a-503599aa0b40.png)


# Deploy

* 아래 명령어를 입력해서 실제로 서버에 올리면 완료.
```bash
# 모든 함수를 서버에 올림
$ firebase deploy --only functions
# 특정 함수만 서버에 올림
$ firebase deploy --only functions:함수명
```

* 명령어를 실행하고 나서 Firebase 페이지로 가보게 되면 Cloud Function이 생성된 것을 알 수 있다.
  사이트에 있는 링크를 클릭해 보면 정상적으로 실행되는 것을 알 수 있다.
![image](https://user-images.githubusercontent.com/56714476/131240724-54ed4a24-eda9-431d-8402-d1a33ef6e06b.png)



# 지역 변경

* 기본으로 함수를 배포하게 되면 `us-cental1` 지역으로 설정 되는데 지역을 변경하려면 함수 배포 전에 코드를 수정해주어야 한다.
  지역을 서울로 변경하고 싶으면 `region('asia-northeast3')` 이 부분을 추가하고 배포하면 된다.<br>

  다른 지역들은 <https://cloud.google.com/functions/docs/locations> 여기서 확인할 수 있다.
```cs
exports.helloWorldSeoul = functions.region('asia-northeast3').https.onRequest((request, response) => {
  functions.logger.info("Hello logs!", {structuredData: true});
  response.send("Hello from Firebase!");
});
```
![image](https://user-images.githubusercontent.com/56714476/131240997-f22c0b2e-15f7-47cf-8576-9d733597a0b4.png)

# References
---

- <https://firebase.google.com/docs/cli/?hl=ko#top_of_page>
- <https://firebase.google.com/docs/functions/manage-functions?hl=ko>
- <https://cloud.google.com/functions/docs/locations>