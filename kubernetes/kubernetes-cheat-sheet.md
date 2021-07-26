#  Cheat sheet
## A Cheat sheet for kubernetes kubernetes and terraform related topics

### Concepts - Basic
#### Node
A Node is a machine where containers will be launched by K8s.

#### Cluster
A group of nodes. Having a cluster, means that one machine failing will not take down the whole application

#### Master Node
A node that watches over and orchestrates the other nodes in a cluster

#### Pods
A encapsulation of a container in Kubernetes. A pod is the smallest object that can be created in kubernetes. In kubernetes, you do not interact directly with a container; instead you interact with pod.

#### Scaling with Pods
To scale up or down, additional pods are deployed. You do **not** add additional containers into a pod. Instead, scaling involves adding more pods into nodes

#### Multi-container Pods
A pod represents a specific piece of an application or infrastructure. This means that often a pod encapsulates on container. However, this is not a requirement. Multiple containers can be in a pod, but they should be different types of containers. Multiple containers in a pod are linked and share many things, I.E. network, storage, fate (when a pod is destroyed, all the containers in it are destroyed).  
Multi-pod containers are a **rare use case**

### Commands - Basic
```bash
kubectl get nodes
```
Lists nodes in cluster
-o wide gives more information

```bash
kubectl get po
```
Lists pods