function do_it() {
  echo "--------- CONDA ---------"
  local SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
  local TARGET_FOLDER="$HOME/.conda/"
  
  echo "Installing local conda files to $TARGET_FOLDER"
  cp -r $SCRIPT_DIR/* $TARGET_FOLDER
  rm $TARGET_FOLDER/install.sh

  echo "Installation completed"
}

do_it "$@"