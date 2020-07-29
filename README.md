# wsl+vscode cool 配置指南

> requirements: win10，电脑得装得下wsl

### 需要安装的软件

- 微软商店中的任意Linux子系统(Ubuntu,debian,centos均可，需要开启wsl子系统功能)

- vscode，官网自寻

## 步骤

- 步骤3、4、5次序可以交换

1. 下载完成wsl后启动，配置用户名密码等。并更换apt源 (清华 阿里)

2. 打开vscode 安装汉化插件 安装remote-wsl

3. https://github.com/Microsoft/WSL/issues/2468 配置wsl 支持32bit程序。

   每次使用需要开启binfmt-support服务
   ```bash
   sudo start binfmt-support start
   ```

4. 安装flex bison 

5. 将cool文件夹放入~目录

   - 可以在wsl中使用mv、cp等指令
   - 可以查询wsl所在文件在系统中的位置直接移动
   - 亦可以将cool文件夹放在任意位置，但是注意CLASSDIR应该设置为/mnt/(盘符)/...

6. 在vscode中打开wsl子系统。ctrl+`打开控制台。之后使用和指导书一致。


# 实验

## 第三次实验

|目标|文件|
|-|-|
|统计行数，列数和字数|Lex1.l|
|记录行数，列数和字数|Lex2.l|
|magic多入口|Lex3.l|
|统计if个数|Lex4.l|

## 第四次实验

|目标|文件|
|-|-|
|？|？|


## 第五次实验

|目标|文件|
|-|-|
|多位计算(加减乘除括号)|task1.l task1.y混合编译|
|double计算(加减乘除括号)|task1p.l task1p.y混合编译|
|布尔运算(与或非括号)|task2.l task2.y混合编译|

## 第六次实验

## Attention

请务必仔细阅读相应的readme
如有必要，请学习编写修改Makefile文件