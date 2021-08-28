---
title: InputField 키보드 엔터 처리
author: lixelsoft
date: 2021-08-27 10:00:00 +09:00 
categories: [Unity, Unity Memo]
tags: [unity, c#]
math: true
mermaid: true
---

# Describe
___

InputField 키보드의 status Listener를 등록한 후 해당 Event를 처리하면 된다.
<br>

## InputField Keyboard Event Listener 등록
---
```cs
[SerializeField] TMP_InputField _inputField;

private void Start() {
  _inputField.onTouchScreenKeyboardStatusChanged.AddListener(OnTouchScreenKeyboardStatusChanged);
}
```


## Keyboard Event 처리 함수 구현
---
```cs
private void OnTouchScreenKeyboardStatusChanged(TouchScreenKeyboard.Status newStatus)  {
  switch (newStatus) {
    case TouchScreenKeyboard.Status.Done:
      // DO Somethine
      break;
    case TouchScreenKeyboard.Status.Visible:
    case TouchScreenKeyboard.Status.Canceled:
    case TouchScreenKeyboard.Status.LostFocus:
      break;
  }
}

```


# Code
---
```cs
public class TouchScreenKeyboardExample : MonoBehaviour {

  [SerializeField] TMP_InputField _inputField;

  private void Start() {
    _inputField.onTouchScreenKeyboardStatusChanged.AddListener(OnTouchScreenKeyboardStatusChanged);
  }

  private void OnTouchScreenKeyboardStatusChanged(TouchScreenKeyboard.Status newStatus)  {
    switch (newStatus) {
      case TouchScreenKeyboard.Status.Done:
        // DO Something
        break;
    case TouchScreenKeyboard.Status.Visible:
    case TouchScreenKeyboard.Status.Canceled:
    case TouchScreenKeyboard.Status.LostFocus:
      break;
    }
  }

}
```


# References
---
- <https://docs.unity3d.com/kr/current/ScriptReference/TouchScreenKeyboard.Status.html>