# WIP: t1-algo-registry
Repository and architecture is still exploration mode.
Registry for ML Model and Algotrader deployments.


### Local testing for transformer-v1
```sh
# build docker images with a specific tag
./build.sh --tag transformer0.4.2 
# starting your docker compose file
docker-compose -f models/transformer-v1/compose.yaml up
# the application should run
```

### Git actions
By tagging the `M7` and `T1-Models` git repository with `git tag transformerV0.4.2 && git  push --tags` github actions are triggered to build and push the images to the registry.

### Deploying to Kubernetes
```sh
# generate kubernetes ressources from docker compose
cd models/{model-name}
kompose convert -o ./kubernetes/
kubectl apply -f ./kubernetes/
# deleting from kubernetes
kubectl delete -f ./kubernetes/
```

### Local Kubernetes Dashboard
```sh
export POD_NAME=$(kubectl get pods -n kubernetes-dashboard -l "app.kubernetes.io/name=kubernetes-dashboard,app.kubernetes.io/instance=kubernetes-dashboard" -o jsonpath="{.items[0].metadata.name}")
   kubectl -n kubernetes-dashboard port-forward $POD_NAME 8443:8443
```

### Port forwarding for local frontend connection
```ssh
# chose the right service name
kubectl port-forward svc/trading-manager 7001:7001
```

![Architecture](docs/architecture.png)