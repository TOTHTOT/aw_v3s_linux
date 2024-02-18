#!/bin/bash

# 要修改的参数
IMAGE_PATH="./arch/arm/boot/zImage"
IMAGE_COPY_PATH="/home/yyh/Learn/linux_kernel/tftp/aw_v3s"
DTB_PATH="./arch/arm/boot/dts/sun8i-v3s-licheepi-zero*.dtb"
DTB_COPY_PATH="/home/yyh/Learn/linux_kernel/tftp/aw_v3s"
DEFCONFIG_NAME="yyh_lichee_zero_defconfig"

# 执行make命令
make $DEFCONFIG_NAME
make

# 检查make命令的返回值
if [ $? -eq 0 ]; then
  # make成功，执行下一步操作
  cp $IMAGE_PATH $IMAGE_COPY_PATH
  cp $DTB_PATH $DTB_COPY_PATH
else
  # make失败，输出错误信息并退出
  echo "Make failed. Error encountered."
  exit 1
fi

