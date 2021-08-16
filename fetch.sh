#! /bin/sh

os="$(cat /etc/*-release | grep "PRETTY_NAME" | sed 's/PRETTY_NAME=//g' | sed 's/"//g')"
shell="$(cat /etc/passwd | grep ^$USER: | grep -Eo ':([^:]*)$' | sed 's/://g')"
[ ! "$wm" ] && [ "$DISPLAY" ] && command -v xprop >/dev/null && {
id=$(xprop -root -notype _NET_SUPPORTING_WM_CHECK)
id=${id##* }
wm=$(xprop -id "$id" -notype -len 100 -f _NET_WM_NAME 8t |
grep '^_NET_WM_NAME' | cut -d\" -f 2)
}
mem="$(free -h | awk '/^Mem/ { print $3"/"$2 }' | sed s/i//g)"

red='[31m'
green='[32m'
white='[37m'

cat << "EOF"
    _,--._.-,
   /\_r-,\_ )
.-.) _;='_/ (.;
 \ \'     \/S )
  L.'-. _.'|-'
 <_`-'\'_.'/
   `'-._( \
    ___   \\,      ___
    \ .'-. \\   .-'_. /
     '._' '.\\/.-'_.'
        '--``\('--'
              \\
              `\\,
                \|
EOF

printf '%s\n' "
${red}os ${white}~ ${green}${os}
${red}sh ${white}~ ${green}${shell##*/}
${red}wm ${white}~ ${green}${wm}
${red}mu ${white}~ ${green}${mem}
"
