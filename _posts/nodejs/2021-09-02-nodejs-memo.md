---
title: nodejs aes-128-cbc
author: Lixelsoft
date: 2021-09-02 00:00:00 +09:00
categories: [Nodejs, Nodejs Memo]
tags: [nodejs, crypto]
math: true
mermaid: true
---

<br>

# Memo
---
```js
const crypto = require("crypto");

const algo = 'aes-128-cbc';
const key = "keykeykeykeykey";
const iv = "iviv";
const value = 'HelloWorld';
const keyBuffer = new Buffer.from(crypto.createHash('md5').update(key).digest('hex'),"hex");
const ivBuffer = new Buffer.from(crypto.createHash('md5').update(iv).digest('hex'),"hex");
const textBuffer = new Buffer.from(value);

// Encryption
let cipher = crypto.createCipheriv(algo, keyBuffer, ivBuffer);
let encrypted = cipher.update(textBuffer);
let encryptedFinal = cipher.final();
let encryptedText = encrypted.toString('base64') + encryptedFinal.toString('base64');
console.log(encryptedText); //xr046x2iGy4IDUHUm+p7lA==

// Decryption
let decipher = crypto.createDecipheriv(algo, keyBuffer, ivBuffer);
decipher.setAutoPadding(true);//padding 처리가 언어별 달라서 확인필요
let decipheredContent = decipher.update(encryptedText, 'base64', 'utf8');
decipheredContent += decipher.final('utf8');
console.log(decipheredContent); //HelloWorld

```



<br>

# References
---
- 