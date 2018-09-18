## 自建jenkins
### 使用流程
- `sh build.sh` 构建镜像
- `sh service.sh` 创建服务

### 配置jenkins使用内存的限制
```
vim entrypoint.sh
-Xms1024m \
-Xmx1024m \
-Xmn512m \
```
