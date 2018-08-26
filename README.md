docker-kosen-robocon-db
====

## 概要

* [kosen-robocon-db](https://github.com/kosen-robocon-db/kosen-robocon-db) の開発環境

## dockerhub

- https://hub.docker.com/r/mcre/kosen-robocon-db/

## 使い方

事前にdockerをインストールしてください。

### お試し

```
docker pull mcre/kosen-robocon-db
docker run --rm -it -p 3000:3000 --name kosen-robocon-db-otameshi mcre/kosen-robocon-db bash -c "rails s"
```

* http://localhost:3000/ でアクセス可能(docker imageをbuildした時点のアプリが表示される)

### 通常

* 初回のみ

```
docker pull mcre/kosen-robocon-db # docker imageをpull。更新されるたびに実行したほうがいいかも。
cd ~/Desktop/ # コンテナと共有するディレクトリの場所(以降適当なディレクトリに読み替えてください)
git clone https://github.com/kosen-robocon-db/kosen-robocon-db.git # ホスト側ファイルでコンテナのなかのリポジトリを上書きしちゃうのでこっちでcloneしておく
docker run -itd -p 3000:3000 --name kosen-robocon-db -v ~/Desktop/kosen-robocon-db:/root/kosen-robocon-db:consistent mcre/kosen-robocon-db:latest # コンテナを作成(エラーが出たら`:consistent`を消してください(mac専用かもなので))
```

* いつも

```
docker start kosen-robocon-db # コンテナが立ち上がっていない場合のみ ※コンテナの状況は`docker ps -a` で確認可能
docker exec -it kosen-robocon-db bash # コンテナの中に入る
git pull
bundle install
rails db:migrate
rails db:seed
rails s
```

* http://localhost:3000/ でアクセス可能

## License

* MIT
  + see LICENSE