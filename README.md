
# doom.d
my doom.d  config

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
  ls ~/.emacs.d/.local/etc/lsp/eclipse.jdt.ls/
```
PaxHeaders.X  bundles       config_mac       config_ss_mac  config_win  java-decompiler  plugins  test-runner
boot-server   config_linux  config_ss_linux  config_ss_win  features    java-test        server
