for file in ~/.config/zsh/*.zsh; do
    [ -r "$file" ] && source "$file"
done
unset file

# hides the % symbol 
PROMPT_EOL_MARK=''
unsetopt PROMPT_SP
unsetopt PROMPT_CR

eval "$(starship init zsh)"


