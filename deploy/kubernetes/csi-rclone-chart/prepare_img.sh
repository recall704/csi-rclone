#!/bin/bash

# 准备一个本地镜像仓库
LOCAL_REGISTRY="registry.cn-shanghai.aliyuncs.com/tk-mirrors"

docker pull registry.k8s.io/sig-storage/csi-provisioner:v5.0.2
docker pull k8s.gcr.io/sig-storage/csi-attacher:v3.4.0
docker pull k8s.gcr.io/sig-storage/csi-node-driver-registrar:v2.4.0
docker pull wunderio/csi-rclone:v3.0.0

# tag
docker tag registry.k8s.io/sig-storage/csi-provisioner:v5.0.2 $LOCAL_REGISTRY/csi-provisioner:v5.0.2
docker tag k8s.gcr.io/sig-storage/csi-attacher:v3.4.0 $LOCAL_REGISTRY/csi-attacher:v3.4.0
docker tag k8s.gcr.io/sig-storage/csi-node-driver-registrar:v2.4.0 $LOCAL_REGISTRY/csi-node-driver-registrar:v2.4.0
docker tag wunderio/csi-rclone:v3.0.0 $LOCAL_REGISTRY/wunderio-csi-rclone:v3.0.0

# push
docker push $LOCAL_REGISTRY/csi-provisioner:v5.0.2
docker push $LOCAL_REGISTRY/csi-attacher:v3.4.0
docker push $LOCAL_REGISTRY/csi-node-driver-registrar:v2.4.0
docker push $LOCAL_REGISTRY/wunderio-csi-rclone:v3.0.0
