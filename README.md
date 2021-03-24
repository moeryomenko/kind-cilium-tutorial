Kind HA K8s cluster with cilium cni plugin.

# Prerequest

Docker

Go 1.11+

# Prepare

Install [kind](https://github.com/kubernetes-sigs/kind#installation-and-usage):

```bash
$ GO111MODULE="on" go get sigs.k8s.io/kind@v0.10.0
```

Install [kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl):

```bash
$ curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
$ curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
$ echo "$(<kubectl.sha256) kubectl" | sha256sum --check
kubectl: OK
$ mv kubectl $HOME/.local/bin
```

Install [helm](https://helm.sh/docs/intro/install/):

```bash
$ mkdir helm \
	&& curl -SL https://get.helm.sh/helm-v3.5.3-linux-amd64.tar.gz | tar xz -C helm --strip-components=1
$ mv helm/helm $HOME/.local/bin
```
