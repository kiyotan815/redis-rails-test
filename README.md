# Redis on Rails

## Redisとは？
メモリ上にKEY-VALUEストアを構築できる。  
key(鍵)とvalue(値）、Rubyのhashみたいだね。  
メモリ上に保存してるんで通常のDBより高速でデータを扱える。  
メモリ上にデータを保存するんでパソコンが落ちるとデータも消えるよ。  

## どんな時に使う？

+ ログイン情報の保持
+ ショッピングカートの情報

などなど、消えても問題ない、容量の少ないデータで用いられることが多いよ。メモリは高いからね。


### 使い方
まずはMacにRedisをインストール  
`brew install redis`

##### コマンド

**起動**  
`redis-server`

**cliの起動**  
`redis-cli`

**DB選択(default は 0~15の範囲)**  
`select 1`

**keyとvalueのセット**  
`set key val`

**指定keyのvalueを表示**  
`get key`

**削除**  
`flushdb`

**Redisクライアントの終了**  
`exit`

##### Railsに導入
```
gem 'redis-rails'
```

configに以下を追記  
`config.cache_store :redis_store, 'redis://localhost:6379/0/cache', { expires_in: 90.minutes } `  


環境ごとにサーバーは変わるので enviroments/以下で指定するとよろし。  

##### initializeの作成
```
config/initializers/redis.rbを作成
以下を記述。

Redis.current = Redis.new

```

`Redis.new(host: ***, port: 0000)`
のように指定も可

##### make sample

```
config/routes.rbに

resource :redis
```


**controller**  
`Redis.current.set(key, value)`  
で値をセット  

**view内で**  
`<%= Redis.current.get(key) %>`  
で参照可能。

