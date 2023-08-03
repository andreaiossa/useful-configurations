
if status is-interactive
    # Commands to run in interactive sessions can go here
end

# export NVM_DIR="$HOME/.nvm"
# [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
# [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

__check_nvm

source ~/.iterm2_shell_integration.fish
oh-my-posh init fish --config ~/mytheme.omp.json | source



# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /usr/local/homebrew/Caskroom/miniforge/base/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/yoza/google-cloud-sdk/path.fish.inc' ]; . '/Users/yoza/google-cloud-sdk/path.fish.inc'; end

export USE_GKE_GCLOUD_AUTH_PLUGIN=True
alias k="kubectl"

kubectl completion fish | source
