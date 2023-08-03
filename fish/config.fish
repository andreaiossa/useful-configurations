
if status is-interactive
    # Commands to run in interactive sessions can go here
end

# export NVM_DIR="$HOME/.nvm"
# [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
# [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

function nvm
   bass source /usr/local/homebrew/Cellar/nvm/0.39.1_1/libexec/nvm.sh --no-use ';' nvm $argv
end

function nvm_find_nvmrc
  bass source ~/.nvm/nvm.sh --no-use ';' nvm_find_nvmrc
end

function __check_nvm --on-variable PWD --description 'Do nvm stuff'
  set node_version (nvm version)
  set -l nvmrc_path (nvm_find_nvmrc)

  if test -n "$nvmrc_path"
    set -l nvmrc_node_version (nvm version (cat $nvmrc_path))

    if [ $nvmrc_node_version = "N/A" ]
      nvm install
    else if [ $nvmrc_node_version != $node_version ]
      nvm use
    end
  else if [ $node_version != (nvm version default) ]
    echo Reverting to nvm default version
    nvm use default
  end
end

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
