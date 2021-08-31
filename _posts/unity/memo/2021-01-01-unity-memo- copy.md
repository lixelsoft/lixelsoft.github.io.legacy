---
title: Code Convension
author: Lixelsoft
date: 2021-08-31 01:00:00 +09:00
categories: [Unity, Unity Memo]
tags: [unity, csharp, convension]
math: true
mermaid: true
---

# Code Convension
---
## Intro
생각들 정리하는 차원에서 Code Convension 정리하는 글이나 작성해야겠다.<br>
앞으로 꾸준히 변경사항이 있으면 Update하도록 하자.

<br>

## Convension
___
1. 모든 네이밍은 CamelCase
2. this는 사용하지 않는다.
3. Indent는 2칸
4. {}는 개행 없이

- `파일명`: 첫 글자 대문자 (class와 동일하게)
- `namespace` : 첫 글자 대문자 
- `class` :  첫 글자 대문자 
- `public 변수` : 첫 글자 대문자
- `private 변수` : _ + 첫 글자 소문자
- `함수명` : 첫 글자 대문자
- `매개변수` : 첫 글자 소문자

<br/>
```cs
// CodeConvensionExample.cs

namespace Lixelsoft {

  public class CodeConvensionExample {
    public int PublicVariable;
    private float _privateVariable;


    public void CodeConvensionFunction(int intVariable, float floagitVariable) {
      console.log($" {PublicVariable} {intVariable} ");
      console.log($" {_privateVariable} {floatVariable} ");

    }
  }

}
```

