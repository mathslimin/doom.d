# install emacs
```bash
sudo apt install libxpm-dev libjpeg-dev libgif-dev libtiff-dev libpng-dev libgnutls28-dev libgccjit0 libgccjit-10-dev libjansson4 libjansson-dev gnutls-bin libtinfo-dev libncurses-dev

./configure --prefix=/opt/soft/emacs --without-x --with-gnutls=no

make -j16
make install
```
# install doom
```bash
git clone https://github.com/mathslimin/doomemacs.git -b develop --depth=1 ~/.config/emacs
cd ~/.config/emacs
./install.sh
~/.config/emacs/bin/doom install
```
# doom.d
my doom.d  config
### install thirdparty software
```shell
sudo apt install clang-format
sudo apt install fd-find -y
sudo apt-get install ripgrep
sudo apt install tidy -y
#centos
wget https://github.com/sharkdp/fd/releases/download/v7.4.0/fd-v7.4.0-x86_64-unknown-linux-gnu.tar.gz
tar -zxvf fd-v7.4.0-x86_64-unknown-linux-*.tar.gz
cd fd-v7.4.0-x86_64-unknown-linux-*
cp ./fd /usr/local/bin/
cp ./fd.1 /usr/local/share/man/man1/
wget https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz 
tar zxvf ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz
mv ripgrep-13.0.0-x86_64-unknown-linux-musl/rg /usr/local/bin/
#yum install ripgrep
#suse
sudo zypper install ripgrep


npm install -g marked
npm install -g stylelint
npm i -g bash-language-server

pip3 install pytest
pip3 install nose
pip3 install black
pip3 install pyflakes
pip3 install isort
pip3 install cmake-language-server
go install mvdan.cc/sh/v3/cmd/shfmt@latest

mkdir -p /opt/soft/clangd
cd /opt/soft/clangd
wget https://github.com/clangd/clangd/releases/download/15.0.3/clangd-linux-15.0.3.zip
unzip clangd-linux-15.0.3.zip
mv clangd_15.0.3/*
#vim /etc/profile add
export PATH=/opt/soft/clangd/bin:$PATH
#vim .bashrc
export PATH=~/.local/bin:$PATH
```
### install jdt
old method
```
emacs run command lsp-install-server
choose jdtls
cd /tmp/lsp-java-installnAxxxe
vim pom.xml # change url to http://10.243.33.98/lsp
mvn  \
  -Djdt.js.server.root=/home/paas/.emacs.d/.local/etc/lsp/eclipse.jdt.ls \
  -Djunit.runner.root=/home/paas/.emacs.d/.local/etc/lsp/eclipse.jdt.ls/test-runner \
  -Djunit.runner.fileName=junit-platform-console-standalone.jar \
  -Djava.debug.root=/home/paas/.emacs.d/.local/etc/lsp/eclipse.jdt.ls/server/bundles \
  -Djdt.download.url=https://download.eclipse.org/jdtls/snapshots/jdt-language-server-latest.tar.gz \
  package
```
new method
```
cd ~/.doom.d
mvn  \
  -Djdt.js.server.root=/home/paas/.emacs.d/.local/etc/lsp/eclipse.jdt.ls \
  -Djunit.runner.root=/home/paas/.emacs.d/.local/etc/lsp/eclipse.jdt.ls/test-runner \
  -Djunit.runner.fileName=junit-platform-console-standalone.jar \
  -Djava.debug.root=/home/paas/.emacs.d/.local/etc/lsp/eclipse.jdt.ls/server/bundles \
  -Djdt.download.url=http://10.243.33.98/jdt-language-server-latest.tar.gz \
  package
```
```bash
  ls ~/.emacs.d/.local/etc/lsp/eclipse.jdt.ls/
```
### some errors
if lsp start fail
```shell
rm -r -f ~/.emacs.d/.local/etc/java-workspace
rm -r -f ~/.emacs.d/.local/etc/workspaces
```

### link articles
[doom lang](https://github.com/hlissner/doom-emacs/tree/master/modules/lang)

[Doom Emacs and Language Servers](https://rgoswami.me/posts/emacs-lang-servers/)


kbd "C-]") 'evil-jump-to-tag

### 使用方法
按F5运行C语言
