
# Cloud / Container Infra — SOP + Deploy

> 云平台 & 容器运维：VPC/子网/安全组 → LAMP/Discuz 部署 → Docker/Nginx 运行 → 监控与回滚。

## Quickstart

```bash
# clone
git clone https://github.com/boboboleah/cloud-container-infra.git
cd cloud-container-infra

# 本地预检
bash scripts/precheck.sh

# 一键安装 Nginx + Docker（Ubuntu 20.04/22.04）
sudo bash scripts/setup_docker_nginx_ubuntu.sh

# 启动示例服务（Nginx 欢迎页）
docker compose -f src/docker-compose.yml up -d
```

## Repo Map
```
.
├── docs/
│   ├── SOP.md                # 腾讯云 CVM 部署全流程 + 回滚
│   ├── DISCUSSIONS.md        # 常见问题/踩坑记录
│   ├── ENV.md                # 环境/镜像/端口/OS 版本
│   └── KNOWN_ISSUES.md
├── scripts/
│   ├── precheck.sh           # 基础依赖/权限检查
│   ├── setup_docker_nginx_ubuntu.sh
│   └── rollback.sh           # 回滚/卸载与数据备份
├── src/
│   ├── nginx.conf
│   ├── docker-compose.yml    # 示例：nginx 服务
│   └── healthcheck.sh
└── .github/workflows/ci.yml  # 语法/可执行性检查（占位）
```

## Deliverables
- ✅ SOP（含 VPC/安规/放通端口/系统初始化脚本）
- ✅ 一键脚本（安装、启动、回滚/备份）
- ✅ 运行截图/日志（请将你的截图放入 `docs/` 并在 SOP 中引用）

## License
MIT
