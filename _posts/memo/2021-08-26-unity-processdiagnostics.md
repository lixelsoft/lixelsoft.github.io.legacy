---
title: Process 실행 시간 확인
author: Lixelsoft
date: 2021-08-26 05:17:00 +09:00
categories: [Unity, Unity Memo]
tags: [unity, csharp]
math: true
mermaid: true


---
# Source Code


<!-- <details> -->
<summary markdown="span"> 
ProcessDiagnostics.cs
</summary>
</br>

```cs
using System.Diagnostics;

namespace lixelsoft {
  public class Test {

    public void ProcessDiagnostics() {
      // using System.Diagnostics;
      Stopwatch SW = new Stopwatch();
      SW.Start();
      float t = 1;
      float k = 0.99f;
      for(int i = 0; i< 100000; i++) {
        float r = t * k;
      }
      SW.Stop();
      UnityEngine.Debug.Log($"<color=lime>[LIXELSOFT]</color> float Result: {SW.Elapsed.ToString()}");
    }
  }

}
```

<!-- </details> -->

<br>

<!-- 
# References
---
- <http://wiki.unity3d.com/index.php?title=ObjExporter> -->