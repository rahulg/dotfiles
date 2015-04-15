set rc=/tmp/cshrc-`date +s`
~/tools/cosh --shell csh ~/.config/cosh/config.py >${rc} && source ${rc} && rm ${rc}
