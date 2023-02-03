# memcached-operator bundle

This repository demonstrates how to deploy a sample kubernetes operator created by the operator sdk tutorial with Porter.

https://sdk.operatorframework.io/docs/building-operators/golang/quickstart/

## Prerequisites
* [Operator-SDK](https://sdk.operatorframework.io/docs/installation/)
* [Porter](https://getporter.org/install/)

## Try it out

Set up Porter by editing creds.yaml and updating the path to your kubeconfig.
Then run the following commands:

```
porter credentials apply -f creds.yaml
porter install -r ghcr.io/carolynvs/memcached-operator:v0.1.0 -c memcached-operator
```

## Build it yourself

1. Build the operator image and push it:
    ```
    export REGISTRY=YOUR_REGISTRY
    make build docker-build docker-push
    ```

2. Set up Porter by editing creds.yaml and updating the path to your kubeconfig. Then run the following command:
    ```
    make porter-setup
    ```

3. Edit porter/porter.yaml and update the reference of the operator image in the `images` section so that the bundle uses your newly built image.

4. Build and install the operator using Porter:
    ```
    cd porter
    porter build
    porter install
    ```

## License

Copyright 2023.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

