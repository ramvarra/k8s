
# Install Jenkins Helm Chart
```
# Add REPO
helm repo add jenkins https://charts.jenkins.io
helm repo update

# Get values
helm show values jenkins/jenkins > jenkins-values-defaults.yaml

# Setup secrets
kubectl -n jenkins create secret generic rrvarra --from-literal=password=xxxxxxxxxxxxxx
kubectl -n jenkins create secret generic gmail --from-literal=api-key=xxxxxxxxxxxxxx
# Install/Upgrade Chart
helm upgrade --install -f jenkins-values.yaml jenkins jenkins/jenkins -n jenkins --create-namespace

# Get admin password
kubectl exec --namespace jenkins -it svc/jenkins -c jenkins -- /bin/cat /run/secrets/additional/chart-admin-password && echo

```
# Install Ingress Controller
```
# Add REPO
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

# See the charts
helm search repo ingress-nginx

# Get chart values
helm show values ingress-nginx/ingress-nginx > ingress-nginx-values.yaml

# Install the controller

RELEASE_NAME=ingress-nginx
helm upgrade --install -f ingress-values.yaml ingress-nginx ingress-nginx/ingress-nginx -n ingress-nginx --create-namespace
```

# Uninstall Ingress Controller
```
helm uninstall ingress-nginx -n ingress-nginx
```

# To remove finalizer for PVC, PV
```
kubectl patch pv/jenkins-home-pv -p '{"metadata": {"finalizers": null}}'
kubectl -n jenkins patch pvc/jenkins-home-pvc -p '{"metadata": {"finalizers": null}}'
```
