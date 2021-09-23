alias src="source ~/.zshrc"

# cleans mule runtime temp files and apps
alias cm=' \
  rm ./logs/**/*.log 2>/dev/null; \
  rm ./logs/**/*.json 2>/dev/null; \
  rm -rf ./.mule/* 2>/dev/null; \
  rm -rf ./apps/* 2> /dev/null'

# builds mule-uber extensions
alias bme='\
  mvn clean install \
    -f mule-build-maven-plugins/pom.xml \
    -DskipTests \
    -Dinvoker.skip \
    -Puber -T0.5C \
    -DskipTests \
    -DskipMunitTests'

# builds mule-uber
alias bm='\
  mvn clean install \
    -DskipTests \
    -DskipMunitTests \
    -T0.5C'

# builds mule-uber and skips revapi validation
alias bmn='\
  mvn clean install \
    -DskipTests \
    -DskipMunitTests \
    -T0.5C \
    -Drevapi.skip'

alias mvnf='mvn formatter:format'
alias mvni='mvn clean install -DskipTests -Dskip.revapi '
alias mvnp='mvn clean package -DskipTests -Dskip.revapi '
alias mvnd='mvn -Dmaven.surefire.debug="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=5005 -Xnoagent -Djava.compiler=NONE" '

alias reset_license='rm conf/muleLicenseKey.lic && touch conf/.lic-mule'

alias agn='ag --nonumbers'
alias ags='ag -s'
alias fdi='fd -I'

# vim aliases
alias v='nvim'
alias vi='nvim'
alias vim='nvim'

# fzf find files in current directory and edit the selected ones
alias f='v $(fzf -i)'
alias -g Z='| fzf'

case $(uname) in
    Linux)
      alias ls='ls --color=tty'
    ;;
    Darwin)
      alias ls="ls -G"
    ;;
esac

alias aws-login=". aws-login.sh"

alias urldecode='python3 -c "import sys, urllib.parse as ul; \
    print(ul.unquote_plus(sys.argv[1]))"'

alias urlencode='python3 -c "import sys, urllib.parse as ul; \
    print (ul.quote_plus(sys.argv[1]))"'
