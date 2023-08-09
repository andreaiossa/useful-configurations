#!/usr/bin/env bash

function do_it() {
  echo "Preparing to apply selected oh-my-posh theme..."
  echo ""
  
  local OMP_THEME
  local THEMES_FOLDER
  local FULL_THEME_PATH
  local DESTINATION_FOLDER

  OMP_THEME=${1}
  THEMES_FOLDER=/themes
  DESTINATION_FOLDER=~/mytheme.omp.json
  

  if [ -d "${THEMES_FOLDER}" ]; then
    echo "Missing THEMES folder. A themes folder containing omp themes is necessary.";
    exit 1;
  fi

  if [ -z "${OMP_THEME}" ]; then
    echo "Missing OMP_THEME. Please specify the theme to apply.";
    exit 1;
  fi

  FULL_THEME_PATH=".${THEMES_FOLDER}/${OMP_THEME}"

  if [ ! -f ${FULL_THEME_PATH} ]; then
    echo "OMP_THEME provided not found. The provided theme must be placed in themes folder for this to work";
    exit 1;
  fi

  echo "Moving ${FULL_THEME_PATH} to ${DESTINATION_FOLDER}..."
  cp ${FULL_THEME_PATH} ${DESTINATION_FOLDER}

  echo "Theme applied correctly"
}
do_it "$@"