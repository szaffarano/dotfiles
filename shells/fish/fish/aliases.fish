abbr getjh "/usr/libexec/java_home -v$1"

abbr setJDK7        'set -g JAVA_HOME (getjh $JAVA7_VERSION)'
abbr setJDK8        'set -g JAVA_HOME (getjh $JAVA8_VERSION)'
abbr setJDK8_Oracle 'set -g JAVA_HOME (getjh $JAVA8_ORACLE_VERSION)'
abbr setJDK11       'set -g JAVA_HOME (getjh $JAVA11_VERSION)'
abbr setJDK13       'set -g JAVA_HOME (getjh $JAVA13_VERSION)'

# cleans mule runtime temp files and apps
abbr cm " \
  rm ./logs/**/*.log 2>/dev/null; \
  rm ./logs/**/*.json 2>/dev/null; \
  rm -rf ./.mule/* 2>/dev/null; \
  rm -rf ./apps/* 2> /dev/null"

# builds mule-uber extensions
abbr bme \
  "mvn clean install \
    -f mule-build-maven-plugins/pom.xml \
    -DskipTests \
    -Dinvoker.skip \
    -Puber -T0.5C \
    -DskipTests \
    -DskipMunitTests"

# builds mule-uber
abbr bm \
  "mvn clean install \
    -DskipTests \
    -DskipMunitTests \
    -T0.5C"

# builds mule-uber and skips revapi validation
abbr bmn \
  "mvn clean install \
    -DskipTests \
    -DskipMunitTests \
    -T0.5C \
    -Drevapi.skip"

abbr reset_license 'rm conf/muleLicenseKey.lic && touch conf/.lic-mule'

# vim aliases
abbr v   'nvim'
abbr vi  'nvim'
abbr vim 'nvim'

# fzf find files in current directory and edit the selected ones
abbr f 'v (fzf -i)'

switch (uname)
    case Linux
      abbr ls "ls --color=tty"
    case Darwin
      abbr ls "ls -G"
end
