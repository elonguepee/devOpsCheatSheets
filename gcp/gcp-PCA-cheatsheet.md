# Cheatsheet for the GCP Professional Cloud Architect Exam

## Concepts
### Descoping for Compliance
- The act of delegating certain parts of your system to meet compliance. Ex. making another company handle credit card transactions to meet PCI DSS

### Autoscaling considerations
Speed of auto-scaling is a very important factor. A comparison of autoscaling methods for the different compute products:
- Google Compute Engine: To auto-scale, new compute instances must be spun up and this can take a **moderate** amount of time. Typically these auto-scale triggers come from resource usage, although combining GCE instances with a cloud load balancer can let you respond to requests as well
- GKE - Kubernetes has a build in horizontal Pod autoscaler. This is based on CPU usage so it tends to autoscale at a similar speed to GCE. This type of scaling refers to adding more pods to the cluster, not more nodes
- GKE Node Pool - If you run out of node space in your cluster, the Node Pool can be setup to autoscale by adding additional Nodes in the form of GCE instances. This autoscaling is in response to the current Nodes being unable to handle the current load. This ends up being a slower autoscale as the current nodes need to run out of space, then the GCE cluster has to provision a new GCE instance to use as a node.
- App Engine Flex - App Engine flex is based on containers. Can autoscale based on requests, but does so "Gradually"
- App Engine Standard - Has no minimum. So if no requests are being received, there is no charge. Autoscales automatically in response to requests and deal with sudden and extreme spikes of traffic.
- Cloud Functions - No minimum. Only pay when being used. Can scale infinitely and instantly.