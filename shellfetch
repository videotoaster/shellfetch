#!/bin/sh
#####################################################
# Shellfetch                                        #
#                                                   #
# A POSIX sh script that's a tad bit like neofetch, #
# but for shells instead of OSes.                   #
#                                                   #
# Licensed under MIT. Developed by VideoToaster.    #
# See LICENSE for details.                          #
#####################################################
LOGODIR="./logos"
renderart() {
    logo="$(cat $1)"
    printf "${logo}\n\n"
}

if [ $# -eq 0 ]; then
    parent=$(ps -o ppid= $$)
    shell_name="$(ps -p $parent | grep -oP '(zsh|bash|ksh|dash|ash|fish)')"
else
    shell_name="$1"
    echo argumentative
fi

case $shell_name in
    "/bin/bash"|"bash")
        renderart "${LOGODIR}/bash.txt"
        cleanname="Bash"
        col="[32m"
        posixcomp="[32mMostly[0m"
        ;;
    "/bin/fish"|"fish")
        renderart "${LOGODIR}/fish.txt"
        cleanname="Fish"
        col="[31m"
        posixcomp="[31mBarely[0m"
        ;;
    "/bin/zsh"|"zsh")
        renderart "${LOGODIR}/zsh.txt"
        cleanname="zsh"
        col="[34m"
        posixcomp="[32mEmulated[0m"
        ;;
    "/bin/ksh"|"ksh")
        renderart "${LOGODIR}/ksh.txt"
        cleanname="ksh"
        col="[33m"
        posixcomp="[32mYes[0m"
        ;;
    "/bin/csh"|"csh")
        renderart "${LOGODIR}/csh.txt"
        cleanname="csh"
        col="[31m"
        posixcomp="[32mYes[0m"
        ;;
    "/bin/dash"|"dash")
        renderart "${LOGODIR}/dash.txt"
        cleanname="dash"
        col="[36m"
        posixcomp="[32mYes[0m"
        ;;
    "/bin/ash"|"ash")
        renderart "${LOGODIR}/ash.txt"
        cleanname="ash"
        col="[32m"
        posixcomp="[32mYes[0m"
        ;;
    *)
        renderart "${LOGODIR}/unknown.txt"
        cleanname="Unrecognized :("
        col="[0m"
        posixcomp="Unknown"
        ;;
esac
reset="[0m[u"
moveuplns () {
    printf "[${1}A[20C"
}
printf "[s" # save current position
moveuplns "8"
printf "${col}$(whoami)@$(cat /etc/hostname)${reset}"
moveuplns "7"
printf "${col}=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=${reset}"
moveuplns "6"
printf "${col}Shell:[0m $cleanname ($shell_name)${reset}"
moveuplns "5"
printf "${col}Kernel:[0m $(uname)${reset}"
moveuplns "4"
printf "${col}POSIX compliant:[0m ${posixcomp}${reset}"
