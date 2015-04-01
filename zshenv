
export EDITOR="vim"
export VISUAL=$EDITOR
export WORDCHARS="" # clear wordchars for better deletion e.g. foo/bar^W -> foo/ instead of ""
export PAGER="less"
export LESS="--RAW-CONTROL-CHARS --ignore-case -M"

# Same colors for bsd ls, gnu ls and the zsh completion list
#
# Order of LSCOLORS (LS_COLORS equivalent)
#
# directory (di), symbolic link (ln), socket (so), pipe (pi), executable (ex),
# block device (bd), character device (cd), executable with setuid (su),
# executable with setgid (sg), directory writable to others with sticky (tw),
# directory writable to others without sticky (-)
export LSCOLORS="GxfxcxdxbxDxDxabagacad"
export LS_COLORS='di=01;36:ln=35:so=32:pi=33:ex=31:bd=01;33:cd=01;33:su=30;41:sg=30;46;:tw=30;42:ow=30;43'

# Local configuration (PATH additions, etc) belong in zshenv.local
if [[ -f ~/.zshenv.local ]]; then
    source ~/.zshenv.local
fi

