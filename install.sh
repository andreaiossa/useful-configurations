function do_it() {
  for d in */ ; do
    if [ -f "$d/install.sh" ]; then
      echo "Found install script for $d folder. Proceeding with custom installation"
      $d/install.sh
    else
      echo "No install script for $d folder. Skipping."
    fi
  done
}

do_it "$@"