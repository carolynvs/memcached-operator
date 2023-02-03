#!/usr/bin/env bash
set -euo pipefail

setControllerImage() {
  # Replace the controller image with the image packaged with the bundle
  cd manifests/
  echo "Setting controller image to $1"
  kustomize edit set image controller=$1
  kustomize build -o operator.yaml
}

waitForDeployment() {
  set +e # allow this next command to fail
  kubectl rollout status deploy/memcached-operator-controller-manager --namespace memcached-operator-system --timeout 30s
  if [[ $? != 0 ]]; then
    echo "Deployment failed, retrieving logs to troubleshoot"
    kubectl logs deploy/memcached-operator-controller-manager --namespace memcached-operator-system -c manager
  fi
}

# Call the requested function and pass the arguments as-is
"$@"
