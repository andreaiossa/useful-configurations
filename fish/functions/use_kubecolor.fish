function use_kubecolor --description "Replace kubectl with kubecolor"
  echo "🎨 Adding colors to kubectl 🎨"
  function kubectl --wraps kubectl
      command kubecolor $argv
  end
end


function no_kubecolor --description "remove kubectl-kubecolor interceptor"
  functions -e kubectl
end