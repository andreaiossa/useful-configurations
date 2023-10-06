# <<< ITERM >>>
source ~/.iterm2_shell_integration.fish

# <<< OHMYPOSH >>>
oh-my-posh init fish --config ~/mytheme.omp.json | source

# <<< CONDA >>>
eval /usr/local/homebrew/Caskroom/miniforge/base/bin/conda "shell.fish" "hook" $argv | source

# <<< KUBE >>>
if [ -f '/Users/yoza/google-cloud-sdk/path.fish.inc' ]; . '/Users/yoza/google-cloud-sdk/path.fish.inc'; end # updates PATH for the Google Cloud SDK.
#export USE_GKE_GCLOUD_AUTH_PLUGIN=True
set -x -U USE_GKE_GCLOUD_AUTH_PLUGIN True

# <<< Aliases >>>
alias k="kubectl"
alias pm="podman"
alias pmm="podman machine"


# <<< Completions >>>
kubectl completion fish | source
k3d completion fish | source
podman completion fish | source
kind completion fish | source

# <<< GLOBAL VARIABLES >>>
set -x -U NUCLEUS /Users/yoza/Desktop/nucleus

# <<< NVM >>>
__check_nvm

# <<< dock-tales >>>
set --export --prepend PATH "/Users/yoza/.rd/bin" # monster rancher desktop
set -x -U DOCKER_HOST "unix:///Users/yoza/.local/share/containers/podman/machine/qemu/podman.sock"