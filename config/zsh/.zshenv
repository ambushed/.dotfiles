export CLICOLOR=1 # enable color support for ls.
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export ZDOTDIR="$HOME/.config/zsh"
export ZSH_CACHE_DIR="$HOME/.cache/zsh"

export DOTFILES=${HOME}/.dotfiles

if which rg >/dev/null; then
  export RIPGREP_CONFIG_PATH=${DOTFILES}/.config/rg/.ripgreprc
fi

path+=(
  /usr/local/bin
)

#-------------------------------------------------------------------------------
#  FZF Settings
#-------------------------------------------------------------------------------
# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders

export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'

export FZF_DEFAULT_OPTS="--reverse \
--cycle \
--bind=esc:abort \
--height 60% \
--border sharp \
--prompt '∷ ' \
--marker ' ' \
--pointer ▶ "

# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

export FZF_TMUX_OPTS='-p80%,60%'
