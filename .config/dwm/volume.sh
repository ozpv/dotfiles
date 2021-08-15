vol="$(amixer get Master | tail -n1 | sed -r 's/.*\[(.*)%\].*/\1/')"

if [ "$vol" == "0" ]; then
  echo "ﱝ muted"
else
  echo "奄 ${vol}%" 
fi
