# rubit
Rubyを学びたい

## Env

* m1 mac(arm64)

## Usage

```
$ docker build -t rubit:latest .
$ docker run --rm -v $(pwd):/app -w /app -it rubit:latest /bin/bash
```

## Memo

```
$ docker run --rm -v $(pwd):/app -w /app -it rubit:latest ruby src/git.rb version
"version"
```

### addを実装する

* https://system.blog.uuum.jp/entry/2020/09/17/110000
* https://made.livesense.co.jp/entry/2017/08/22/080000
* https://gist.github.com/mmasaki/865352
* https://github.com/git/git
* https://docs.ruby-lang.org/ja/latest/class/Zlib=3a=3aGzipWriter.html
* https://uxmilk.jp/22615
* https://docs.ruby-lang.org/ja/latest/method/Digest=3a=3aBase/i/hexdigest.html
* https://koseki.hatenablog.com/entry/2014/04/22/inside-git-1



```
$ docker run --rm -v $(pwd):/app -w /app -it rubit:latest ruby src/git.rb add src/git.rb src/add.rb
$ ls -lt | head -n 2
total 32
-rw-r--r--  1 hogehoge staff    10 12  6 18:56 be_25f2f5c8c6b805c68be7e78e558f2f5fa5fa6e
```

でけた. インデックスに追加のところがまだわからない.

### cat-fileを実装する

やること

* .git/objects 以下にハッシュ値のファイルが吐き出されるように修正する
* ハッシュ値を受け取って、該当のobjectsファイルを検索する
    * 存在しない場合 → メッセージ表示 `fatal: Not a valid object name ${ハッシュ値}`
    * 存在する場合
        * `-t` ファイルタイプを表示
        * `-p` addしたファイルを表示（？）