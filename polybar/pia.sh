# check if dropbox process is running
status=$(piactl get connectionstate)
region=$(piactl get region)
region="${region^}" #
region="${region:0:2}"

if [[ $status == "Disconnected" ]]; then
    label="%{T3}%{T-} ${region}"
    echo "%{F#808080}${label}%{F-}"
else
    label="%{T3}%{T-} ${region}"   
    echo "${label}"
fi
