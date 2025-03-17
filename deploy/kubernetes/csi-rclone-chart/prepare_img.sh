#!/bin/bash

# 准备一个本地镜像仓库
# 支持用户输入 LOCAL_REGISTRY

# 使用方法
# ./prepare_img.sh [registry]
# 例如: ./prepare_img.sh registry.example.com/my-repo

DEFAULT_REGISTRY="local.harbor.io/release2"

# 如果用户没有输入值，则使用默认值
if [ -z "$1" ]; then
  LOCAL_REGISTRY="$DEFAULT_REGISTRY"
  echo "Using default registry: $LOCAL_REGISTRY"
else
  LOCAL_REGISTRY="$1"
  echo "Using custom registry: $LOCAL_REGISTRY"
fi


echo "docker pull registry.cn-shanghai.aliyuncs.com/tk-mirrors/csi-provisioner:v5.0.2"
echo "docker pull registry.cn-shanghai.aliyuncs.com/tk-mirrors/csi-attacher:v3.4.0"
echo "docker pull registry.cn-shanghai.aliyuncs.com/tk-mirrors/csi-node-driver-registrar:v2.4.0"
echo "docker pull registry.cn-shanghai.aliyuncs.com/tk-mirrors/wunderio-csi-rclone:v3.0.0"

# Print tag commands
echo "docker tag registry.cn-shanghai.aliyuncs.com/tk-mirrors/csi-provisioner:v5.0.2 $LOCAL_REGISTRY/csi-provisioner:v5.0.2"
echo "docker tag registry.cn-shanghai.aliyuncs.com/tk-mirrors/csi-attacher:v3.4.0 $LOCAL_REGISTRY/csi-attacher:v3.4.0"
echo "docker tag registry.cn-shanghai.aliyuncs.com/tk-mirrors/csi-node-driver-registrar:v2.4.0 $LOCAL_REGISTRY/csi-node-driver-registrar:v2.4.0"
echo "docker tag registry.cn-shanghai.aliyuncs.com/tk-mirrors/wunderio-csi-rclone:v3.0.0 $LOCAL_REGISTRY/wunderio-csi-rclone:v3.0.0"

# Print push commands
echo "docker push $LOCAL_REGISTRY/csi-provisioner:v5.0.2"
echo "docker push $LOCAL_REGISTRY/csi-attacher:v3.4.0"
echo "docker push $LOCAL_REGISTRY/csi-node-driver-registrar:v2.4.0"
echo "docker push $LOCAL_REGISTRY/wunderio-csi-rclone:v3.0.0"

# Print sed command
echo "sed -i \"s|registry.cn-shanghai.aliyuncs.com/tk-mirrors|${LOCAL_REGISTRY}|g\" values.yaml"
