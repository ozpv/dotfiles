#status="$(cat /sys/class/net/w*/operstate 2>/dev/null)"
status="$(cat /sys/class/net/e*/operstate 2>/dev/null)"

if [ "$status" == "up" ]; then
  echo "直 online"
else
  echo "睊 offline" 
fi
