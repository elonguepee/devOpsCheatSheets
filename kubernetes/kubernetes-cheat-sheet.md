#  Cheat sheet
## A Cheat sheet for kubernetes kubernetes and terraform related topics

### Concepts - Basic
#### Node
A Node is a machine where containers will be launched by K8s.

#### Cluster
A group of nodes. Having a cluster, means that one machine failing will not take down the whole application

#### Master Node
A node that watches over and orchestrates the other nodes in a cluster

### Commands - Basic
```bash
kubectl get nodes
```
Lists nodes in cluster