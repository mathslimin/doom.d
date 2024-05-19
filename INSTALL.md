ubuntu系统git clone 报错error: RPC failed; curl 56 GnuTLS recv error (-110)的解决办法
报错信息：
error: RPC failed; curl 56 GnuTLS recv error (-110): The TLS connection was non-properly terminated.

1. 首先安装一些必要的环境和依赖
```bash
apt-get install build-essential fakeroot dpkg-dev
```
3. 在home路径下创建一个名为git-rectify的路径(路径名不重要，可以为其他名称)
```bash
mkdir ~/git-rectify
```
如果想隐藏目录，不想在/home下可见，也可以把目录名改为 .git-rectify
```bash
mkdir ~/.git-rectify
```
5. 进入路径，获取git的源文件
```bash
cd ~/git-rectify
apt-get source git
```
7. 安装依赖
```bash
sudo apt-get build-dep git
```
8. 安装libcurl的依赖文件
```bash
sudo apt-get install libcurl4-openssl-dev
```
10. 进入目录(原链接中这里有错误，不需要解压步骤)
```bash
cd git-2.17.1/
```
路径名后面2.*是版本号，需要看一下自己的版本

12. 修改文件内容，需要修改两个文件
```bash
vim ./debian/control # 把libcurl4-gnutls-dev 修改为 libcurl4-openssl-dev
vim ./debian/rules # 把TEST=test整行删除
```
14. 编译和构建安装包
```bash
sudo dpkg-buildpackage -rfakeroot -b
```
15. 退回上一级目录，安装编译好的安装包
```bash
cd ..
sudo dpkg -i git_2.17.1-1ubuntu0.4_amd64.deb
```
完成以上步骤即可解决error: RPC failed; curl 56 GnuTLS recv error (-110): The TLS connection was non-properly terminated问题。
