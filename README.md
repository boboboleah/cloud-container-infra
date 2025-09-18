# Cloud Container Infra (Nginx + Docker Compose)

一个最小可复现的容器化 **Nginx** 示例：一条命令启动、开箱即用，并附带 SOP 文档与脚本。

## Prerequisites
- Windows 11 + Docker Desktop（WSL2 引擎）
- 已开启虚拟化与 WSL2

## Quickstart

```bash
# 启动
docker compose up -d

# 健康检查（期望 200）
curl -I http://localhost:8080

# 查看日志
docker compose logs -f --no-color

# 停止
docker compose down
```

## Repo Map
```
.
├─ docker-compose.yml
├─ src/
│  ├─ nginx.conf              # 将挂载到 /etc/nginx/conf.d/default.conf
│  └─ html/
│     └─ index.html           # /usr/share/nginx/html/index.html
├─ scripts/
│  ├─ up.ps1                  # docker compose up -d
│  ├─ down.ps1                # docker compose down
│  └─ logs.ps1                # docker compose logs -f --no-color
└─ docs/
   ├─ SOP.md
   ├─ ENV.md
   └─ KNOWN_ISSUES.md
```

## 使用脚本（PowerShell）
```powershell
./scripts/up.ps1
./scripts/logs.ps1
./scripts/down.ps1
```

## 配置说明
- 自定义 `src/nginx.conf` 挂载到容器 `/etc/nginx/conf.d/default.conf`
- 静态页面 `src/html/index.html` 映射到容器 `/usr/share/nginx/html/index.html`

## 常见问题
- **nginx: [emerg] unknown directive "server"**  
  说明挂载到了错误的文件（`/etc/nginx/nginx.conf`），请改为 `/etc/nginx/conf.d/default.conf`。

- **8080 端口被占用**  
  修改 `docker-compose.yml` 中 `ports: - "8080:80"` 的左侧端口。

## License
MIT
