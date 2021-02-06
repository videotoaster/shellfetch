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

[ "$1" = "" ] && shell_name="$SHELL" || shell_name="$1"

case $shell_name in
    "/bin/bash"|"/usr/bin/bash")
        renderart "${LOGODIR}/bash.txt"
        cleanname="Bash"
        col="[32m"
        posixcomp="[32mMostly[0m"
        ;;
    "/bin/fish"|"/usr/bin/fish")
        renderart "${LOGODIR}/fish.txt"
        cleanname="Fish"
        col="[31m"
        posixcomp="[31mBarely[0m"
        ;;
    "/bin/zsh"|"/usr/bin/zsh")
        renderart "${LOGODIR}/zsh.txt"
        cleanname="zsh"
        col="[34m"
        posixcomp="[32mEmulated[0m"
        ;;
    "/bin/ksh"|"/usr/bin/ksh")
        renderart "${LOGODIR}/ksh.txt"
        cleanname="ksh"
        col="[33m"
        posixcomp="[32mYes[0m"
        ;;
    "/bin/csh"|"/usr/bin/csh")
        renderart "${LOGODIR}/csh.txt"
        cleanname="csh"
        col="[31m"
        posixcomp="[32mYes[0m"
        ;;
    "/bin/dash"|"/usr/bin/dash")
        renderart "${LOGODIR}/dash.txt"
        cleanname="dash"
        col="[36m"
        posixcomp="[32mYes[0m"
        ;;
    "/bin/ash"|"/usr/bin/ash")
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
