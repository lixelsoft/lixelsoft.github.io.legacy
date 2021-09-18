---
title: 유니티에서 홀딩 버튼 구현하기.
author: lixelsoft
date: 2021-09-16 10:00:00 +09:00 
categories: [Unity, Unity UI]
tags: [unity, c#]
math: true
mermaid: true
---

# Intro
## IPointerDownHandler, IPointerUpHandlder 인터페이스로 구현하기
- public void OnPointerDown(PointerEventData eventData) : 버튼을 클릭/터치하는 순간 실행됨
- public void OnPointerUp(PointerEventData eventDate) : 버튼 클릭/터치를 떼는 순간 실행됨<br/>

아래 스크립트를 버튼이 있는 오브젝트에 추가해주면 해당 스크립트가 작동함. `OnPointerDown`은 버튼이 눌린 순간 1회만 호출되기 때문에
`coroutine`으로 구현했다. `Update()`로 구현해도 상관 없지만 개인적으로 `Update()`함수는 지양하는 편이라서 사용하지 않았음.

## Unity Event 추가
- `UnityEvent`를 추가해서 Button Action 호출을 유니티 상에서 연결 할 수 있게끔 구현함.

<br/>
<br/>

# Code
``` c#
  public class HoldButtonExample : MonoBehaviour, IPointerDownHandler, IPointerUpHandler {

    [SerializeField] private UnityEvent _buttonAction;
    private bool _isButtonHolding;

    private void Awake() {
      _isButtonHolding = false;

    }

    public void OnPointerDown(PointerEventData eventData) {
      DebugX.Log($"<color=#2ecc71>[Lixelsoft]</color> Button Click");
      _isButtonHolding = true;
      StartCoroutine(CheckHoldingButton());
    }

    public void OnPointerUp(PointerEventData eventData) {
      _isButtonHolding = false;
      DebugX.Log($"<color=#2ecc71>[Lixelsoft]</color> Button Detach");
    }

    private IEnumerator CheckHoldingButton() {
      // * 버튼 클릭 후 일정 시간 기다려주기.
      int timer = 0;
      WaitForSeconds wfs = new WaitForSeconds(0.1f);

      while (true) {
        if (!_isButtonHolding) {
          DebugX.Log($"<color=#2ecc71>[Lixelsoft]</color> Detach button");
          yield break;
        }

        if (timer++ > 5) {
          // * 버튼을 클릭하자마자 바로 로직을 실행 하기 보단 일정 텀을 줌.
          // * DO Sth.
          DebugX.Log($"<color=#e74c3c>[Lixelsoft]</color> Do Sth...");
          _buttonAction?.Invoke();
        }
        
        DebugX.Log($"<color=#2ecc71>[Lixelsoft]</color> 버튼 홀딩중 {timer}");
        yield return wfs;
      }
    }
  }


```

# References
---
- <https://docs.unity3d.com/kr/current/ScriptReference/TouchScreenKeyboard.Status.html>