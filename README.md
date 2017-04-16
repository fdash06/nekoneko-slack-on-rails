# nekoneko-slack-on-rails

## Installation

Add to Gemfile.
```ruby
# Gemfile
gem 'nekoneko-slack-on-rails', git: 'https://github.com/fdash06/nekoneko-slack-on-rails.git'
```

and

```bash
bundle install
```

## How to Create slack client

```bash
rails generate slack_client hoge
```

Set slack token.

```bash
export HOGE_SLACK_TOKEN=xxxxxxxxxxxxxxxxxxx
```

and run!!

```
rails server
```


## 使い方

1. SlackのApp Directoryから連携用にBotsを追加する。
1. Installationに従ってslack_clientを作成する
1. BotsのAPI Tokenを環境変数xxx_SLACK_TOKENにいれる(slack_client名がhogeなら環境変数はHOGE_SLACK_TOKENになる)
1. `$(RAILS_ROOT)/app/slack_clients/hoge.rb` に処理を書く！
1. Railsサーバーを起動し、作成したbotのいるチャンネルで話しかける
1. 設定したメソッドの処理が実行される！！

## XXX:

springが効いている場合、clientが複数立ち上がることがある？
その場合は `spring kill` する
