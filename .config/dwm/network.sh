#status="$(cat /sys/class/net/w*/operstate 2>/dev/null)"
status="$(cat /sys/class/net/e*/operstate 2>/dev/null)"
[ "$status" == "up" ] && echo "直 online" || echo "睊 offline"  
