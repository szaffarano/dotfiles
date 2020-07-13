alias getjh "/usr/libexec/java_home -v$1"

alias setJDK7        'set -g JAVA_HOME (getjh $JAVA7_VERSION)'
alias setJDK8        'set -g JAVA_HOME (getjh $JAVA8_VERSION)'
alias setJDK8_Oracle 'set -g JAVA_HOME (getjh $JAVA8_ORACLE_VERSION)'
alias setJDK11       'set -g JAVA_HOME (getjh $JAVA11_VERSION)'
alias setJDK13       'set -g JAVA_HOME (getjh $JAVA13_VERSION)'

# cleans mule runtime
alias cm "rm ./logs/**/*.log 2>/dev/null; rm ./logs/**/*.json 2>/dev/null; rm -rf ./.mule/* 2>/dev/null; rm -rf ./apps/* 2> /dev/null"

# builds mule-uber
alias bm "mvn clean install -f mule-build-maven-plugins/pom.xml -DskipTests -Dinvoker.skip -Puber -T0.5C -DskipTests -DskipMunitTests && mvn clean install -DskipTests -DskipMunitTests -T0.5C"

# builds mule-uber and skips revapi validation
alias bmn "mvn clean install -f mule-build-maven-plugins/pom.xml -DskipTests -Dinvoker.skip -Puber -T0.5C -DskipTests -DskipMunitTests && mvn clean install -DskipTests -DskipMunitTests -T0.5C -Drevapi.skip"

alias reset_license 'rm conf/muleLicenseKey.lic && touch conf/.lic-mule'

# vim aliases
alias v 'nvim'
alias vi 'nvim'
alias vim 'nvim'

alias f 'v `fzf -i`'

alias ls "ls -G"
