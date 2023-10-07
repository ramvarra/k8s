export K8S_CERT_KEY=87573c1e2ec632b52b8ee578e279e2bb1855777abff2f4423e2deae6b21e7f09
export K8S_TOKEN=wacn0w.ekdgh25ltqeidq21

sudo kubeadm init \
  --upload-certs  \
  --certificate-key $K8S_CERT_KEY \
  --token $K8S_TOKEN \
  --control-plane-endpoint kmaster:6443 \
  --pod-network-cidr=10.10.0.0/16 \
  --apiserver-cert-extra-sans kmaster.ramvarra.com

kubeadm join kmaster:6443 --token wacn0w.ekdgh25ltqeidq21 \
        --discovery-token-ca-cert-hash sha256:f930646a6740ef8fd8f1e819d65415942d9a3230f323221b72bf6ce0f0e0af28

kubeadm join kmaster:6443 --token wacn0w.ekdgh25ltqeidq21 --discovery-token-unsafe-skip-ca-verification

# Flannel Install

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# after 24H

kubeadm join kmaster:6443 --token pahmov.9cjrmlbsqjk41tbd --discovery-token-ca-cert-hash sha256:f930646a6740ef8fd8f1e819d65415942d9a3230f323221b72bf6ce0f0e0af28
