# check if dropbox process is running
ps aux | grep -v grep | grep dropbox-dist >/dev/null
