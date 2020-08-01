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


# 编译器实验 coolc

西安交通大学 编译原理 实验

由于老师给的文件中有过多干扰，故建立此repo

修改中难免有错误，请以各个PA中的readme为准

## 第一次实验

配置环境(见上)

## 第二次实验

PA1

编写编译运行coolc程序

## 第三次实验

PA1

|目标|文件|
|-|-|
|统计行数，列数和字数|Lex1.l|
|记录行数，列数和字数|Lex2.l|
|magic多入口|Lex3.l|
|统计if个数|Lex4.l|

- 编译命令

```bash
# flex 识别
flex ${file}.l
# gcc 生成.out可执行文件
gcc -o ${file}.out lex.yy.c -lfl
```

## 第四次实验

PA2

|目标|文件|
|-|-|
|coolc的词法分析器编写|cool.flex|


## 第五次实验

PA3

|目标|文件|
|-|-|
|多位计算(加减乘除括号)|task1.l task1.y联合编译|
|double计算(加减乘除括号)|task1p.l task1p.y联合编译|
|布尔运算(与或非括号)|task2.l task2.y联合编译|
|一位数计算器(减法、乘法、赋值)|task3.y 单文件编译|
|一位数计算器(加减乘除括号赋值)|task4.y 单文件编译|
|多位数计算器(加减乘除括号赋值)|task5.y 单文件编译|


- 联合编译命令

```bash
# flex 识别token
flex -o ${file}.yy.c ${file}.l
# bison生成.tab.h 定义token
bison -d ${file}.y
# bison生成.tab.c
bison -o ${file}.tab.c ${file}.y
# 生成可执行文件
gcc -o ${file}.out ${file}.yy.c ${file}.tab.c
```

- 单文件编译命令

```bash
# bison生成.c
bison -o ${file}.c ${file}.y
# 生成可执行文件
gcc -o ${file}.out ${file}.c
```


## 第六次实验

PA3

cool.y为原语法分析器
cool.ans.y即为语法分析器，可替换cool.y编译使用，增加了对let的支持

## 第七次实验

## 第八次实验

## Attention

请务必仔细阅读相应的readme
如有必要，请学习编写修改Makefile文件
