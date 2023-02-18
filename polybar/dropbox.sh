# check if dropbox process is running
readarray -t rows <<< $(dbxcli-linux-amd64 du 2>/dev/null) 
used=${rows[0]}
allocated=${rows[2]}

if [[ $used =~ "Used" ]]; then

    used=$(sed 's|Used: ||' <<< $used)
    used=$(sed 's| GiB|G|' <<< $used)
    allocated=$(sed 's|Allocated: ||' <<< $allocated)
    allocated=$(sed 's| TiB|T|' <<< $allocated)
    label="%{T2}%{T-} ${used}/${allocated}"
else
    label="-"
fi

if a=$(ps aux | grep -v grep | grep dropbox-dist); then
    echo "${label}"
else
    echo "%{F#808080}${label}%{F-}"
fi
