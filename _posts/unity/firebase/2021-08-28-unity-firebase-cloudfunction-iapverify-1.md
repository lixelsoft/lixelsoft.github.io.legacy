---
title: Firebase CloudFunction 사용해서 인앱결제 검증하기 -1-
author: lixelsoft
date: 2021-08-28 01:00:00 +09:00
categories: [Unity, Unity Firebase]
tags: [unity, firebase, iap] 
math: true
mermaid: true
---





# Create API Key
___

## Google Play Console 서비스 계정 등록
- 일단 영수증 검증에 사용할 API 계정을 만들어야 한다. Google Play Console -> 설정 -> API 액세스에 가서 `새 서비스 계정 만들기`를 클릭해서 계정 한개를 생성해 준다. 아마 아래와 같은 팝업창이 생성되고 `Googole Cloud Platform`으로 이동하라고 나올텐데 해당 사이트로 이동해준다.
![image](https://user-images.githubusercontent.com/56714476/131425441-8b6b2025-ea72-4da5-a2c3-e6d29f13f1dd.png)

- Google Cloud Platform에서 `서비스 계정 만들기`를 클릭해 주고 새로운 계정을 생성해 준다.
  - `서비스 계정 세부정보`에서 계정 정보를 기입해 준다.
![image](https://user-images.githubusercontent.com/56714476/131425761-6890d64c-66fa-4ad2-b211-14d0781047d4.png)
  - `액세스 권한 부여`에서 `편집자`를 선택해서 추가해준다.
![image](https://user-images.githubusercontent.com/56714476/131425897-a43fc3c7-03a4-4243-8dce-bcc94340c60b.png)
  - `"3"`번은 공란으로 하고 완료를 클릭해주면 아래와 같이 계정이 생성된다.
![image](https://user-images.githubusercontent.com/56714476/131426172-b7bc2569-95b6-4d25-8674-c5396b25fb18.png)

## Key Download
- API에서 사용할 계정 Key를 Download해 줘야한다. 생성 된 키를 클릭하고 새로운 키 만들기를 선택해 준다.
- 키 유형은 `JSON`으로 선택해서 다운로드를 받으면 키생성이 완료된다.
![image](https://user-images.githubusercontent.com/56714476/131426437-fcc1515a-7e26-44aa-8709-8f21109fc671.png)

# 권한 부여
___

## 서비스 계정 권한 부여
- Google Play Console 페이지로 돌아와서 서비스 계정을 보면 조금전에 만든 계정이 생성된 것을 볼 수 있다. 이제 이 계정에 앱 재무관련 정보를 접근할 수 있도록 권한을 부여해야 한다.
- `액세스 권한 부여`를 클릭해서 권한 설정 페이지로 들어간다.
![image](https://user-images.githubusercontent.com/56714476/131426993-e9cfb537-9269-41e6-ac80-fb0ecc024179.png)
- 앱 권한에서 권한을 부여할 앱 추가해주고 `계정 권한`에서 `재무 데이터`에 체크를 반드시 해줘야 한다.
![image](https://user-images.githubusercontent.com/56714476/131441312-5a0f5fb7-c3db-4b5e-a018-f747aea6ee10.png)
- 밑에 변경사항 저장을 하면 이제 인앱결제 시 사용할 계정생성이 완료되었다.


작성중 ...