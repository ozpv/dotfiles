#status="$(cat /sys/class/net/w*/operstate 2>/dev/null)"
status="$(cat /sys/class/net/e*/operstate 2>/dev/null)"

if [ "$status" == "up" ]; then
  echo " online"
else
  echo "ﲁ offline" 
fi
