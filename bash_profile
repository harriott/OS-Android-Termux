# vim: set fdl=1 ft=sh sw=2:

# $ITstack/unix_like-Android/Termux/bash_profile

# Termux  ~/.bash_profile
# -----------------------
# $PREFIX = /data/data/com.termux/files/usr
# $HOME = /data/data/com.termux/files/home
# pkg up[grade]; pkg in exa neofetch nnn

alias o=echo
cb(){
  cp $T/bash_profile $HOME/.bash_profile
  cp $T/inputrc $HOME/.inputrc
} # configure Bash
[[ $(getprop) =~ CPH2375 ]] && export st=/storage/emulated/0  # OPPO A76
[[ $(getprop) =~ XQ-AU52 ]] && export st=/storage/EA90-C4AC  # Sony Xperia 10 II
  export core=$st/Dr-JH-core
    [[ $(getprop) =~ CPH2375 ]] && export Sh=$st/Dr-JH-Sh-OppoA76
    [[ $(getprop) =~ XQ-AU52 ]] && export Sh=$st/Dr-JH-Sh-XA10II
    export T=$core/IT_stack/unix_like-Android/Termux
export phone=$(getprop | grep ro.product.odm.model | awk '{print $2}')

#=> better file managing
alias a='exa -aF'  # grid, handily showing up symlinks
alias er='exa -alR'  # show permissions and symlinks recursively
alias et='exa -T'  # for tree

alias n=nano

alias s="stat -c '%A %a %h %U %G %s %y %n'"
alias so="stat -c '%a %n'"  # octal rights
alias sm="stat -c '%y %n'"  # modification time

c() { if [ -n "$1" ]; then cd "$1" || return 1; else cd ..; fi; ls -a; }

cft(){
  find . -path './.git' -prune -o -type f -name "*" | rev | cut -d . -f1 | rev | sort | uniq -ic | sort -rn''
} # count filetypes

shopt -s autocd dotglob extglob globstar nullglob

up(){
  local dir=""
  uplimit=$1
  for ((upshift=1 ; upshift <= uplimit ; upshift++)); do dir=$dir/..; done
  dir=$(echo $dir | sed 's/^\///')
  if [ -z "$dir" ]; then dir=..; fi
  cd $dir
} # move up [n] directories

#==> nnn
alias nn=nnn
export NNN_TMPFILE="$PREFIX/tmp/.lastd"  # cd on quit, but doesn't work...

#=> command history
alias e=exit  # ensuring history is saved
alias h='history'
export HISTCONTROL=ignoreboth:erasedups
shopt -s histappend

#=> internetish
alias p='ping -c 3 8.8.8.8'
wp(){ curl 'wttr.in/Paris?0'; }  # weather

