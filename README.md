# rubit
Rubyを学びたい

## Env

* m1 mac(arm64)

## Usage

```
$ docker build -t rubit:latest .
$ docker run --rm -v $(pwd):/app -w /app -it rubit:latest /bin/bash
```
