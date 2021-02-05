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
if [ "$1" != "" ]; then
    restoreme=$SHELL
    SHELL="$1"
fi
case $SHELL in
    "/bin/bash"|"/usr/bin/bash")
        renderart "${LOGODIR}/bash.txt"
        cleanname="Bash"
        col="\e[32m"
        posixcomp="\e[32mMostly\e[0m"
        ;;
    "/bin/fish"|"/usr/bin/fish")
        renderart "${LOGODIR}/fish.txt"
        cleanname="Fish"
        col="\e[31m"
        posixcomp="\e[31mBarely\e[0m"
        ;;
    "/bin/zsh"|"/usr/bin/zsh")
        renderart "${LOGODIR}/zsh.txt"
        cleanname="zsh"
        col="\e[34m"
        posixcomp="\e[32mEmulated\e[0m"
        ;;
    *)
        renderart "${LOGODIR}/unknown.txt"
        cleanname="Unrecognized :("
        col="\e[0m"
        posixcomp="Unknown"
        ;;
esac
reset="\e[0m\e[u"
moveuplns () {
    printf "\e[${1}A\e[20C"
}
printf "\e[s" # save current position
moveuplns "8" 
printf "${col}$(whoami)@$(cat /etc/hostname)${reset}"
moveuplns "7" 
printf "${col}=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=${reset}"
moveuplns "6"
printf "${col}Shell:\e[0m $cleanname ($SHELL)${reset}"
moveuplns "5"
printf "${col}Kernel:\e[0m $(uname)${reset}"
moveuplns "4"
printf "${col}POSIX compliant:\e[0m ${posixcomp}${reset}"
if [ "$1" != "" ]; then
    SHELL="$restoreme"
fi	
