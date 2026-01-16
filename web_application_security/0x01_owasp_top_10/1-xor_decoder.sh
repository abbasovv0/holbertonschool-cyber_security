h=${1#\{xor\}}
for((i=0;i<${#h};i+=2));do printf "\\$(printf '%03o' $((0x${h:i:2}^90)))";done;echo
