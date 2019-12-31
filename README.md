﻿# Welcome to source code of Lean's OpenWrt Firmware

本套代码保证肯定可以编译成功。里面包括了 R9 所有源代码，包括 IPK 的。
> This set of code is guaranteed to compile successfully. It includes all the source code of R9, including the IPK.

你可以自由使用，但源码编译二次发布请注明我的 GitHub 仓库链接。谢谢合作！
> You can use it freely, but please indicate the link to my GitHub repository for the second release of source code compilation. Thank you for your cooperation!

## [![Build](https://img.shields.io/github/workflow/status/coolsnowwolf/lede/OpenWrt-CI/master?color=blue)](https://github.com/coolsnowwolf/lede/actions?query=workflow%3AOpenWrt-CI) [![Contributors](https://img.shields.io/github/contributors/coolsnowwolf/lede?color=blue)](https://github.com/coolsnowwolf/lede/graphs/contributors) [![Last commit](https://img.shields.io/github/last-commit/coolsnowwolf/lede?color=blue)](https://github.com/coolsnowwolf/lede/commits/master)

> 注意：\
    * 不要用 root 用户进行 git clone 和 编译 ！！！\
    * 国内用户编译前最好准备好梯子 \
    * 默认登陆IP: 192.168.1.1, 密码: password

> Notice: \
    * Don't git clone and compile as root ！！！\
    * Default Login IP: 192.168.1.1, Default Login Password: password

## 编译方式(Method to Compile)

### 首先装好 Ubuntu 64bit，推荐  Ubuntu 18.04 LTS X86_64

    > linux 平台下编译固件最推荐 ~
    > windows 平台建议使用 WSL2(require version 2004) * 虚拟机性能几乎没有损失
    > macOS 平台安装 GNU 软件包之后进行编译(官方这里不作推荐)

### 打开 Ubuntu Terminal 然后输入

* 进行源码的 clone

```bash
git clone https://github.com/coolsnowwolf/lede.git where/you/want/to/place
```

* 环境的更新和依赖包的安装
  
```bash
sudo apt update && apt upgrade && apt autoremove

sudo apt -y install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint device-tree-compiler
```

* 更新 feeds

```bash
cd where/you/want/to/place
./scripts/feeds update -a
./scripts/feeds install -a
```

> 说明 \
> `./scripts/feeds update -a` 将获取定义在feeds.conf和feeds.conf.default中所有的包信息 \
> `./scripts/feeds update -a` will to get all the latest package definitions
defined in feeds.conf / feeds.conf.default respectively. \
> `./scripts/feeds install -a` 将安装上述获取的所有包的软连接 \
> `./scripts/feeds install -a` will to install symlinks of all of them into
package/feeds/. \

* 进行可视化配置
  
```bash
make menuconfig
```

* 进行固件编译

```bash
make -j1 V=s （-j1 后面是线程数。第一次编译推荐用单线程，国内请尽量全局科学上网）
```

## 特别提示

* 源代码中绝不含任何后门和可以监控或者劫持你的 HTTPS 的闭源软件，SSL 安全是互联网最后的壁垒。安全干净才是固件应该做到的；
* 你可以根据这个源代码自由修改/发布你编译后的固件，但不能编译后反过来说我抄你的你才是原创；
* 所以如果你是 Mike Bill ，本人不欢迎你使用/用过本源代码，因为这样会导致你的亲妈原地爆炸；
* 如有技术问题需要讨论，欢迎加入 QQ 讨论群：OP共享技术交流群 ,号码 297253733 ，加群链接: 点击链接加入群聊【OP共享技术交流群】：https://jq.qq.com/?_wv=1027&k=5yCRuXL

## 开源声明(License)

Copyright © 2006~2020 [coolsnowwolf](https://github.com/coolsnowwolf). \
本项目是在 [GPLv3](https://github.com/coolsnowwolf/lede/raw/master/LICENSE) 开源协议下进行开发和制作的，欢迎各位参与其中，但是请谨遵开源协议，谢谢合作！

Copyright © 2006~2020 [coolsnowwolf](https://github.com/coolsnowwolf). \
This project is under [GPLv3](https://github.com/coolsnowwolf/lede/raw/master/LICENSE) License. Everyone is welcome to participate, but please follow the open source agreement, thank you for your cooperation!
