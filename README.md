
# doom.d
my doom.d  config
### install soft
```shell
sudo apt install fd-find
npm install -g marked
sudo apt install tidy
npm install -g stylelint
pip install pytest
pip install nose
pip install black
pip install pyflakes
pip install isort

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
