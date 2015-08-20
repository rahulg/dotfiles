set rc=/tmp/cshrc-`date +s`
/usr/local/bin/cosh --shell csh ~/.config/cosh/config.rb >${rc} && source ${rc} && rm ${rc}
