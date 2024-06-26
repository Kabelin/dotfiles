# GPG key
set -gx GPG_TTY (tty)

# NNN config
export NNN_BMS="d:$HOME/Downloads/;D:$HOME/Documents/;p:$HOME/Projects/;b:$HOME/Projects/Bit/;m:/media/;c:$HOME/.config/"
export NNN_CONVERT=1
export NNN_FIFO='/tmp/nnn.fifo'
export NNN_ICONLOOKUP=1
export NNN_OPENER="$HOME/.config/nnn/plugins/nuke"
export NNN_OPTS="AcHr"
export NNN_PLUG='m:-!|mediainfo "$nnn";x:!chmod +x $nnn;d:dragdrop;v:imgview;k:kdeconnect;p:preview-tui'
export NNN_SPLIT='v'
export NNN_TERMINAL="alacritty --title preview-tui"
export NNN_PREVIEWIMGPROG="viu"
export NNN_TRASH=1
export NNN_ARCHIVE='\\.(7z|a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|rar|rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)$'

# Zoxide config
export _ZO_EXCLUDE_DIRS="$HOME/.bkp:/media:/mnt"

# Source asdf
source ~/.asdf/asdf.fish

# Set JAVA_HOME for asdf java's plugin
. ~/.asdf/plugins/java/set-java-home.fish

# Load starship prompt
starship init fish | source

# Load zoxide, AKA jump
zoxide init --cmd j fish | source

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
