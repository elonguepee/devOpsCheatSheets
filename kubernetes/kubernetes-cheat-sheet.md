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

#### Controllers
Processes that monitor Kubernetes objects and respond accordingly

#### Replication Controller
A controller that monitors a pod or set of pods

#### Replica Set
A newer replacement for replica controllers

#### Replica Set vs Replication Controller
In a replica set, the selector is required to be specified. Where in replica controller it is optional

### Commands - Basic
```bash
kubectl get nodes
```
Lists nodes in cluster
-o wide gives more information

```bash
kubectl run <podname> --image=<image_name>
```
Creates a pod with a specific image

```bash
kubectl get po
```
Lists pods. Can also use 'get pods'

```bash
kubectl describe pod <podname>
```
Gives details of a specific pod

```bash
kubectl apply -f <config_filepath>
```
Creates a pod(or other object) using a config file

```bash
kubectl get replicationcontroller
```
Shows all replication controllers

```bash
kubectl get replicationcontroller
```
Shows all replication controllers

```bash
kubectl replace -f <config path>
```
Replaces a config with a newer version