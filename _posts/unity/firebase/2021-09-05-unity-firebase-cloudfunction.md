---
title: Firebase CloudFunction 앱에서 호출하기
author: lixelsoft
date: 2021-08-28 01:00:00 +09:00
categories: [Unity, Unity Firebase]
tags: [unity, firebase, cloudfunction] 
math: true
mermaid: true
---

# Intro
---
- 기존에는 유니티에서 WebRequest로 구현했었는데 Firebase github를 보다가 라이브러리로도 구현할 수 있는 거 보고 작성하게됨.
- ❗ 유니티가 아직 AppCheck기능을 지원하지 않아 프로젝트에 적용하지는 않음.
  
# Install
- 먼저 유니티에 `FirebaseFirestore.unitypackage`를 Import해준다.<br>
![image](https://user-images.githubusercontent.com/56714476/132111976-9d551216-4d8f-4eb9-94f4-797188541c6d.png)

<br>

# Usage
---
## CloudFunction
```js
// Saves a message to the Firebase Realtime Database but sanitizes the text by removing swearwords.
exports.addMessage = functions.https.onCall((data, context) => {

  // Message text passed from the client.
  const text = data.text;
  // Authentication / user information is automatically added to the request.
  const uid = context.auth.uid;
  const name = context.auth.token.name || null;
  const picture = context.auth.token.picture || null;
  const email = context.auth.token.email || null;index.js

  return {
    Result: true,
    Message: "Hello World"
  }
});
```
## Unity
> 참고: 기본 `us-central1` 외의 위치에서 실행 중인 함수를 호출하려면 초기화 시 적절한 값으로 설정해야 합니다. 예를 들어 Android에서는 getInstance(FirebaseApp app, String `region`)를 사용하여 초기화합니다.
```cs
  public class FirebaseCloudFunction {

    private FirebaseFunctions functions;
    public FirebaseCloudFunction() {
      // 초기화
      this.functions = FirebaseFunctions.GetInstance(FirebaseApp.DefaultInstance, "asia-northeast3");
    }

    public async Task TestFunction(string text) {
      // Create the arguments to the callable function.
      var data = new Dictionary<string, object>();
      data["text"] = text;
      data["push"] = true;

      // Call the function and extract the operation from the result.
      var func = functions.GetHttpsCallable("addMessage");
      await func.CallAsync(data).ContinueWith(task => {
        if (task.IsFaulted || task.IsCanceled) {
          DebugX.Log($"<color=#e74c3c>[Lixelsoft]</color> Failed");
        } else {
          DebugX.Log($"<color=#2ecc71>[Lixelsoft]</color> Success");
          DebugX.Log($"<color=#2ecc71>[Lixelsoft]</color> Data : {task.Result.Data.ToString()}");
        }
      });
    }
  }

```


# References
---
- <https://firebase.google.com/docs/functions/callable#unity>
- <https://github.com/firebase/quickstart-unity/tree/master/functions/testapp>
- <https://github.com/firebase/quickstart-unity/blob/master/functions/testapp/Assets/Firebase/Sample/Functions/TestCase.cs>
- <https://firebase.google.com/docs/functions/callable>
