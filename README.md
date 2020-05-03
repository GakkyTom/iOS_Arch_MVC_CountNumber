# 概要
[iOS設計パターン入門](https://peaks.cc/books/iOS_architecture)の 「5.2.2 Cocoa MVC」の写経+α

![Simulator Screen Shot - iPhone SE (2nd generation) - 2020-05-04 at 00 11 25](https://user-images.githubusercontent.com/52947331/80917737-f2bad800-8d9b-11ea-8e59-769fe3ed38b5.png)

## MEMO
原初MVCと比べ、 View と Model の再利用が容易になった。
Controllerが肥大しがち

### Controller
Mediatorパターンによって、お互いを知らない View と Model との架け橋役を担当する。
Viewのライフサイクルも管理する。

Controller は Model の更新通知を監視→更新通知を受け取ったらどのように更新するか を View に指示する

### Model
ビジネスロジックを担当

### View
画面の描画を担当
