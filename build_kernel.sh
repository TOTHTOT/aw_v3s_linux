#!/bin/bash

# 执行make命令
make yyh_lichee_zero_defconfig
make

# 检查make命令的返回值
if [ $? -eq 0 ]; then
  # make成功，执行下一步操作
  cp ./arch/arm/boot/zImage ~/Learn/linux_kernel/tftp/aw_v3s
  cp ./arch/arm/boot/dts/sun8i-v3s-licheepi-zero*.dtb ~/Learn/linux_kernel/tftp/aw_v3s
else
  # make失败，输出错误信息并退出
  echo "Make failed. Error encountered."
  exit 1
fi

