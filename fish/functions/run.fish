function run
  function add_new_run_variable
    set -l new_command $argv[1]
    set -l command_alias $argv[2]

    if set -q new_command; and set -q command_alias
      echo "Request to save $new_command command with alias $command_alias to run from $PWD folder received":

      set -U "fish_run_command_original_name_$command_alias" $new_command
      set -U "fish_run_command_folder_$command_alias" $PWD 

    else
      echo "Additional arguments 'command' and 'alias' are required to complete this action"
      return 1
    end
  end

  function run_command
    set -l command_alias $argv[1]
    set array "fish_run_command_original_name_$command_alias" "fish_run_command_folder_$command_alias"
    set -l command_to_run $$array[1]
    set -l folder_where_to_run $$array[2]
    echo "Preparing to run command $command_to_run in folder $folder_where_to_run"

    fish -c "
      cd $folder_where_to_run 
      eval $command_to_run
    "
  end

  set -l options a/add
  argparse $options -- $argv

  if set -q _flag_add
    echo "Add action selected"
    add_new_run_variable $argv
    return 0
  else
    echo "Running command"
    run_command $argv
  end
end