# SOP（本地验证）
1) docker compose up -d
2) curl -I http://localhost:8080     # 200 OK
3) docker ps                         # 有 nginx:alpine，状态 Up
4) 浏览器打开 http://localhost:8080
5) 停止：docker compose down
