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