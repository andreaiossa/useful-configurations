function intercept_command --description "Intercept a command and replace it with another"
    # Define the command to intercept
    set -l original_command "k"
    
    # Define the replacement command
    set -l replacement_command "kubecolor"
    
    # Create a function that replaces the original command
    function $original_command --wraps $original_command
        # You can add conditions here if needed
        echo "Intercepted '$original_command', executing '$replacement_command' instead"
        
        # Execute the replacement command with all original arguments
        command $replacement_command $argv
    end
end