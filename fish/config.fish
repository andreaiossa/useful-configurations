# <<< ITERM >>>
source ~/.iterm2_shell_integration.fish

# <<< OHMYPOSH >>>
oh-my-posh init fish --config ~/mytheme.omp.json | source

# <<< CONDA >>>
eval /usr/local/homebrew/Caskroom/miniforge/base/bin/conda "shell.fish" "hook" $argv | source

# <<< KUBE >>>
if [ -f '/Users/yoza/google-cloud-sdk/path.fish.inc' ]; . '/Users/yoza/google-cloud-sdk/path.fish.inc'; end # updates PATH for the Google Cloud SDK.
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
alias k="kubectl"
kubectl completion fish | source

# <<< GLOBAL VARIABLES >>>
set -U NUCLEUS /Users/yoza/Desktop/nucleus

# <<< NVM >>>
__check_nvm