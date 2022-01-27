
# doom.d
my doom.d  config
### install soft
```shell
sudo apt install fd-find
npm install -g marked
sudo apt install tidy
npm install -g stylelint
pip3 install pytest
pip3 install nose
pip3 install black
pip3 install pyflakes
pip3 install isort
pip3 install cmake-language-server

```
install jdt
```
emacs run command lsp-install-server
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
```bash
  ls ~/.emacs.d/.local/etc/lsp/eclipse.jdt.ls/
```
