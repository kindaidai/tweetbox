# Tweetbox
　　ログインユーザのhome timelineを閲覧できて、保存ができる

## バージョン
```
$ ruby -v
ruby 2.5.3p105 (2018-10-18 revision 65156) [x86_64-darwin18]

$ bundler -v
Bundler version 1.17.2

$ bin/rails -v
Rails 5.2.2

$ mysql -V
mysql  Ver 14.14 Distrib 5.7.21, for osx10.13 (x86_64) using  EditLine wrapper
```

## 仕様
  - twitterを使ったOAuth認証で、新規会員登録・ログイン・ログアウトができること。
    - 認証は[gem sorcery](https://github.com/Sorcery/sorcery)を使用しています。
    - 新規会員登録については、twitter認証が通ったら自動的にusersテーブルに保存されます。
    - 新規会員登録のログインは、twitter認証が通ったらログインできます。

  - 初回ログイン時に下記の3人のユーザをフォローすることがレコメンドされること。
    - 初回ログインのタイミングは、新規会員登録後にしています。
    - レコメンドユーザは、@jack, @yukihiro_matz, @JeffBezos
    - レコメンドされたユーザをフォローすることができます。
    - フォローしたユーザはタイムラインに表示されます。

  - タイムラインは60秒毎にチェックされ、更新があった場合は通知されること。
    - タイムラインは60秒ごとに「更新する」ボタンがメニューバーに表示されます
    - この更新ボタンは60秒ごとにTwitterに問い合わせていないです。

  - 表示されているツイートに対して保存ボタン設置、保存ボタンを押すとDBにツイートが保存されること。
    - tweetsテーブルに保存されます。

  - タイムラインのツイートはデフォルトで100件にしています。
    - タイムライン最下部に「読み込む」ボタンを設置して、さらに100件ずつ読み込めるようにしています。

  - TwitterAPIの使用は[gem twitter](https://github.com/sferik/twitter)を使用しています。

  - CSSフレームワークは[bulma](https://bulma.io/)を使用しています。

  - テンプレートエンジンは[slim](https://github.com/slim-template/slim/blob/master/README.jp.md)を使用しています。

  - テストフレームワークは[RSpec](https://github.com/rspec/rspec)を使用しています。
  
## セットアップ
  - ruby 2.5.3をインストール
  - bundler 1.17.2をインストール
  - mysql 5.7.21をインストール
  - このリポジトリを`git clone`する(ブランチはmasterブランチを使用)
  - master.keyを `config/` に置く
  - `bundle install --path vendor/bundle`
  - `bundle exec rails db:setup`
  - `bin/rails s`
  
