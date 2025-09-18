
# SOP — 腾讯云 CVM 上线 LAMP/Discuz & Docker/Nginx（示例）

> 目标：在 **VPC + 安全组** 下快速上线 Web 服务，并具备回滚能力。适配 Ubuntu 20.04/22.04。

## 0. 架构与端口
- VPC：10.0.0.0/16，子网：10.0.1.0/24
- 安全组放通：22/80/443（入站），全部出站
- 反向代理：Nginx（80/443） → 应用容器（内网端口）

## 1. 云资源创建
1. 创建 VPC/子网 → 购买 CVM（公共镜像 Ubuntu 22.04）
2. 绑定安全组（入站 22/80/443），并且**在控制台的防火墙/安全组双重检查**
3. 绑定弹性公网 IP（如需要）

## 2. 系统初始化
```bash
sudo apt update && sudo apt -y upgrade
sudo timedatectl set-timezone Asia/Shanghai
sudo useradd -m devops || true
sudo usermod -aG sudo,adm,systemd-journal devops
```

## 3. 安装 Docker & Nginx（见脚本）
```bash
sudo bash scripts/setup_docker_nginx_ubuntu.sh
```

## 4. 启动容器服务（示例：Nginx）
```bash
docker compose -f src/docker-compose.yml up -d
docker ps
```

## 5. 验证与监控
- `curl -I http://<EIP>` 返回 200
- `docker logs <container>` 无错误
- 建议：接入 `nginx -V`、`logrotate`，并导出 `/var/log/nginx` 到对象存储（可选）

## 6. 回滚与备份
- 紧急回滚：`bash scripts/rollback.sh`（停止容器 → 备份挂载卷 → 恢复默认 Nginx）
- 数据备份策略：每日打包挂载卷到 `/opt/backups/$(date +%F).tar.gz`（可用 crontab）

## 7. Discuz! on LAMP（可选）
- 如果要演示 LAMP/Discuz：
  - 方案 A：容器化 LAMP（`bitnami/mariadb` + `php:apache`）
  - 方案 B：宿主机安装 Apache/MariaDB/PHP（按需）
- 记得在安全组放通 80/443，数据库仅内网访问。

> 将你在实验中的截图（如：VPC/安全组、CVM 控制台、服务访问）放到 `docs/` 并在本文引用。
