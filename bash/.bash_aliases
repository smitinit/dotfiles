# ~/.bash_aliases
#
# Personal aliases for daily development.
# Loaded automatically from ~/.bashrc

# ==================================================
# Navigation
# ==================================================

alias cls='clear'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# ==================================================
# Shell Helpers
# ==================================================

alias reload='source ~/.bashrc'
alias h='history'

# Show PATH one entry per line
alias path='echo "$PATH" | tr ":" "\n"'

# ==================================================
# Clipboard
# ==================================================

# Copy stdin to clipboard
# Example: pwd | cpy
alias cpy='xclip -selection clipboard'

# Print clipboard contents
alias pst='xclip -selection clipboard -o'

# ==================================================
# Git
# ==================================================

alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gl='git log --oneline --graph --decorate'

# ==================================================
# Safe File Operations
# ==================================================

# Move files to trash instead of deleting
alias trash='trash-put'

# Verbose recursive mkdir
alias mk='mkdir -pv'

# ==================================================
# System Information
# ==================================================

# Human-readable disk usage
alias df='df -h'
alias du='du -h'

# Show listening ports and processes
alias ports='ss -tulpn'

# Public IP address
alias myip='curl -s ifconfig.me && echo'

# ==================================================
# End of File
# ==================================================
