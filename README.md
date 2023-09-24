# About okina_honban

このプロジェクトはTokyo Flutter Hackason向けのプロジェクトです。  
`git clone`して使用してください。

## Getting Started

- **Flutter Version**

このプロジェクトではFlutterの最新バージョンを利用します。
2023/09/24時点でFlutter 3.13.5がstableとなっているので各自でFlutterのバージョンを確認し、
必要あれば個人で利用しているツール等でアップグレードしておいてください。

- **事前準備**

VSCodeの設定をします。Android Studioを利用している方は適宜読み替えてください。  
`settings.json`に以下の設定をしておくことをお勧めします。

1. コマンドパレット（Ctrl/Cmd+Shift+P）から「Preferences: Open Settings (JSON)」を呼び出す
2. JSONに以下のエントリーを追加する

```
{
    // ①コード整形の場合
    "editor.formatOnSave": true,
    "editor.codeActionsOnSave": {
        // ②コード修正の場合
        "source.fixAll": true,
	    // ③importの順番整理の場合
        "source.organizeImports": true,
    },
}
```
参考:[【Flutter】VSCodeでの開発が便利👍になる機能、設定まとめ](https://zenn.dev/inari_sushio/articles/0f4c606c8340ee#%E8%A8%AD%E5%AE%9A%E6%96%B9%E6%B3%95-2)

- **環境構築**

`flutter doctor` を実行してチェックマークがついていれば準備OKです。

```
$ flutter doctor
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.13.5, on macOS 13.5.2 22G91 darwin-arm64, locale ja-JP)
[✓] Android toolchain - develop for Android devices (Android SDK version 33.0.0)
[✓] Xcode - develop for iOS and macOS (Xcode 14.2)
[✓] Chrome - develop for the web
[✓] Android Studio (version 2021.3)
[✓] VS Code (version 1.82.2)
[✓] Connected device (3 available)
[✓] Network resources

• No issues found!
```

Githubから`okina_honban`のプロジェクトをクローンしてビルドできたら環境構築完了です.

以下はSSHでクローンしてます。
SSHでクローする前に事前準備が必要になるのでリンクを参考に各自で設定してください。

参考: [GitHubでssh接続する手順 ~ 公開鍵・秘密鍵の生成から ~](https://qiita.com/shizuma/items/2b2f873a0034839e47ce)

※flutterコマンドが使える場所にクローンしてくる必要があります。  
flutterコマンドが使えるかは、`which flutter`コマンドでパスの場所を確認する、  
`flutter --version`でバージョンが表示されるかなどで確認しましょう。

```
// ローカルにクローン
git clone git@github.com:Umigishi-Aoi/okina_honban.git

// プロジェクトルートに移動する
cd okina_honban

// 依存パッケージの取得をするため`flutter pub get`する
okina_honban$ flutter pub get
```

またHTTPSでクローンする場合はpersonal access tokenの設定が必要になるので各自で設定してください。

[Githubでアクセストークンを使う](https://rfs.jp/server/git/github/personal_access_tokens.html)

## How to use command

本プロジェクトでは開発を円滑に進められるようにテンプレートファイルを用意しています。  
[Makefile](./Makefile)に定義しているコマンドを利用することでView関連のファイルやModel, Repository, ルーティングを自動生成することができます。  
ユースケースに応じて指定のコマンドを叩いてください。  

[自動生成コマンドの使い方はこちら](./docs/how-to-drive-this-project.md)
