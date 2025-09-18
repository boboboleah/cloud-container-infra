# 已知问题
- `nginx: [emerg] unknown directive`：nginx.conf 不是 root 的 nginx.conf，而是 conf.d/*.conf。已修复为挂载到 `/etc/nginx/conf.d/default.conf`。
- 端口占用：8080 被占用时启动失败。解决：改 compose 里端口映射或释放端口。

