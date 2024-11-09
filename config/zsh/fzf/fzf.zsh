
export FZF_SHELL_PATH="$(brew --prefix fzf)/shell"

[ -f "$FZF_SHELL_PATH/key-bindings.zsh" ] && source "$FZF_SHELL_PATH/key-bindings.zsh"

[ -f "$FZF_SHELL_PATH/completion.zsh" ] && source "$FZF_SHELL_PATH/completion.zsh"


