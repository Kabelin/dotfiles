# FZF catppuccin mocha theme
set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# GPG key
set -gx GPG_TTY (tty)

# Source asdf
source ~/.asdf/asdf.fish

# Set JAVA_HOME for asdf java's plugin
. ~/.asdf/plugins/java/set-java-home.fish

# Load starship prompt
starship init fish | source

# Abbreviations
abbr -a -- n nnn
abbr -a -- lv lvim
abbr -a -- nv nvim
abbr -a -- v vim

# if status --is-login
#   if test (tty) = /dev/tty1
#     exec Hyprland > .hyprland.log.txt 2> .hyprland.err.txt
#   end
# end
