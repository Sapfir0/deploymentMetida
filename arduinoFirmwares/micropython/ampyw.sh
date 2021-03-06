
#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color
bold=$(tput bold)
normal=$(tput sgr0)

# check arguments
flash=0
if [ $# -eq 1 ] && [[ "$1" == "--flash" || "$1" == "-f" ]]; then
    flash=1
fi

# show help
if [ $# -eq 0 ]; then
    echo -e "${RED}${bold}ampyw v0.11${normal}${NC}";
    echo -e "${GREEN}${bold}Usage:${normal}${NC}";
    echo "./ampyw.sh [-f] or [ampy command]";
    echo -e "${GREEN}${bold}Commands:${normal}${NC}";
    echo "--flash or -f = flashes all python files from the folder where this script is located";
    echo "any other commands will be passed directly to ampy";
    echo -e "${GREEN}${bold}Examples:${normal}${NC}";
    echo "./ampyw.sh -f";
    echo "./ampyw.sh ls";
    echo "./ampyw.sh run boot.py";
    exit 1;
fi

# pass commands to ampy
if [ $flash == 0 ]; then
    echo ">> ampy --port ${port} ${@:1}"
    eval "ampy --port ${port} ${@:1}"
    exit
fi

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
me=`basename "$0"` 

# write all py files
for i in "${dir}"/*; do
    if [ -d "$i" ]; then
        echo -e "${RED}${bold}Skipping directory:${NC}${normal} $i"
    elif [ -f "$i" ]; then
        if [[ "$i" == *py ]]; then
            echo -e "${GREEN}${bold}Putting:${NC}${normal} $i"
            eval "ampy --port ${port} put \"$i\""
            sleep 3s
        elif [[ "$i" != "${dir}/${me}" ]]; then
            echo -e "${RED}${bold}Skipping:${NC}${normal} $i"
        fi
    fi
done
