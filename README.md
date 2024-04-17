# shadowsocks-libev

## ssr-local 使用方法

1. 准备好配置文件

  ```json
  {
    "_comment":"本地 socks5 地址",
    "local_address":"127.0.0.1",
    "_comment":"本地 socks5 端口",
    "local_port": 1080,
    "_comment":"服務器地址",
    "server":"xxxx",
    "_comment":"服務器端口",
    "server_port": 14871,
    "_comment":"服務器驗證",
    "password":"kate is beauty",
    "_comment":"加密方式",
    "method":"chacha20",
    "_comment":"協議",
    "protocol":"auth_chain_a",
    "_comment":"協議參數",
    "protocol_param":"",
    "_comment":"混淆",
    "obfs":"tls1.2_ticket_auth",
    "_comment":"混淆參數",
    "obfs_param":"",
    "fast_open":true
}
```

2. docker run

```shell
docker run -p 1080:1080 -v 本地配置文件路径:/etc/ssr-config.json ghcr.io/jorben/ssr-local:latest ss-local -c /etc/ssr-config.json
```