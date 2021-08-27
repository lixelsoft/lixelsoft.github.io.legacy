---
title: 앱에서 다른 앱 실행하기 (with 변수 전달)
author: lixelsoft
date: 2021-08-27 00:03:00 +09:00
categories: [Unity, Unity Memo]
tags: [unity, csharp] 
math: true
mermaid: true
---

# Sender App 

```cs
  public void SenderApp() {
    AndroidJavaClass UnityPlayer = new AndroidJavaClass("com.unity3d.player.UnityPlayer");
    AndroidJavaObject currentActivity = jc.GetStatic<AndroidJavaObject>("currentActivity");
    AndroidJavaObject pm = currentActivity.Call<AndroidJavaObject>("getPackageManager");
    AndroidJavaObject intent = pm.Call<AndroidJavaObject>("getLaunchIntentForPackage", "com.company.appname"); 
    intent.Call<AndroidJavaObject>("putExtra", "stringTest", "strTest");
    intent.Call<AndroidJavaObject>("putExtra", "intTest", 10);
    intent.Call<AndroidJavaObject>("putExtra", "floatTest", 123.22f);
    
    currentActivity.Call("startActivity", intent);
  }
```


# Receiver App 

```cs
  public void ReceiverApp() {
    AndroidJavaClass UnityPlayer = new AndroidJavaClass("com.unity3d.player.UnityPlayer");
    AndroidJavaObject currentActivity = UnityPlayer.GetStatic<AndroidJavaObject>("currentActivity");
    AndroidJavaObject intent = currentActivity.Call<AndroidJavaObject>("getIntent");
    AndroidJavaObject extras = intent.Call<AndroidJavaObject>("getExtras");
    string stringTest = extras.Call<string>("getString", "stringTest");
    int intTest = extras.Call<int>("getInt", "intTest");
    float floatTest = extras.Call<float>("getFloat", "floatTest");
    
    Debug.Log($"stringTest: {stringTest}");
    Debug.Log($"intTest: {intTest}");
    Debug.Log($"floatTest: {floatTest}");
  }
```

