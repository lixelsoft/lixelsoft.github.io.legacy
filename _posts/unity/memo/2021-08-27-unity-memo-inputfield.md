---
title: InputField TouchScreenKeyboard Done Event 처리
author: lixelsoft
date: 2021-08-27 10:00:00 +09:00 
categories: [Unity, Unity Memo]
tags: [unity, c#]
math: true
mermaid: true
---


Unity의 InputField는 Default로 OS의 키보드를 오픈하게 되어 있다.<br>
여기서는 직접 키보드를 오픈해서 컨트롤 하기 위해 해당 기능을 disable시켜 준다.

![image](https://user-images.githubusercontent.com/56714476/131131480-eb6bcea5-ffd5-40aa-b31a-6464f4d8a172.png)
<br>
InputField의 Inspector창에서 `Hide Soft Keyboard`, `Hide Mobile Input`을 체크해준다.<br>
<br>

```cs
if (_keyboard == null && _inputField.isFocused) {
  // Open Keyboard
  _keyboard = TouchScreenKeyboard.Open("", TouchScreenKeyboardType.Default);
}
```
InputField를 Focus하면 키보드 띄워주는 것을 막아놨기 때문에 코드로 키보드를 오픈해주도록 구현한다.<br>
<br>


```cs
if (_keyboard != null && _keyboard.status == TouchScreenKeyboard.Status.Done) {
  // Do Something.
  _keyboard = null;
}
```
그리고 나서 return 버튼을 입력했는지 체크해주는 코드를 구현해 준다.
<br>
<br>

# Code
```cs
public class TouchScreenKeyboardExample : MonoBehaviour {

  private TouchScreenKeyboard _keyboard;
  [SerializeField] TMP_InputField _inputField;

  private void Update() {
    if (_keyboard == null && _inputField.isFocused) {
      // Open Keyboard
      _keyboard = TouchScreenKeyboard.Open("", TouchScreenKeyboardType.Default);
    }

    if (_keyboard != null && _keyboard.status == TouchScreenKeyboard.Status.Done) {
      // Do Something.
      _keyboard = null;
    }
  }
}
```
