# <<< ITERM >>>
set -U NVM_DIR "$HOME/.nvm"
source ~/.iterm2_shell_integration.fish

# <<< OHMYPOSH >>>
oh-my-posh init fish --config ~/mytheme.omp.json | source

# <<< CONDA >>>
eval /opt/homebrew/Caskroom/miniforge/base/bin/conda "shell.fish" "hook" $argv | source

# <<< KUBE >>>
if [ -f '/Users/yoza/google-cloud-sdk/path.fish.inc' ]; . '/Users/yoza/google-cloud-sdk/path.fish.inc'; end # updates PATH for the Google Cloud SDK.
set -x -U USE_GKE_GCLOUD_AUTH_PLUGIN True

# <<< Aliases >>>
alias k="kubectl"
alias kx="kubectx"
alias m8="microk8s"
alias kk="microk8s kubectl"
alias pm="podman"
alias pmm="podman machine"

# <<< GLOBAL VARIABLES >>>
set -x -U NUCLEUS /Users/yoza/Desktop/projects/nucleus
# set -x -U DOCKER_HOST "unix:///Users/yoza/.local/share/containers/podman/machine/qemu/podman.sock"
set -U run_variables_file_path "$HOME/.config/fish/run_variables"
set -x -U GOPRIVATE "github.com/andreaiossa"

# <<< NVM >>>
__check_nvm &> /dev/null

# << RUN AUX >>
if not test -e $run_variables_file_path
  touch $run_variables_file_path
end 
# <<< vscode integrated terminal >>>
# if test -n "$VSCODE_INTEGRATED_TERMINAL"
#   echo "Running inside vscode integrated terminal. Using default nvm."
#   nvm use default &> /dev/null
# else
#   __check_nvm
# end