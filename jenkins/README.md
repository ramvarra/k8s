
# Add repo
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

# See the charts
helm search repo ingress-nginx

# Get chart values
helm show values ingress-nginx/ingress-nginx > ingress-nginx-values.yaml

# Install the controller
# RELEASE_NAME=ingress-nginx
helm upgrade --install -f ingress-values.yaml ingress-nginx ingress-nginx/ingress-nginx -n ingress-nginx --create-namespace

helm uninstall ingress-nginx -n ingress-nginx