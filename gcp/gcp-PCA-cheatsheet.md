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

### Dataproc vs. Dataflow vs. Dataprep
**Dataproc** 
- for existing Hadoop or Spark Applications
- to take advantage of ML/Data Science ecosystem
- Need to control

**Dataflow**
- for new data processing pipelines
- for streaming
- fully managed

**Dataprep**
- Fully managed
- No Ops
- Fully managed
- For data preparation, no processing
- For exploring data and making it ready for a system like Dataflow or dataproc

### Cloud Storage Concerns
- Google Cloud Storage is usually first choice. Managed, pay for what you use, infinitely scaleable, simple, etc. The most cloud native solution
- Google Filestore is for NAS based lift-and-shifts, and multiple writers
- Local SSD is for maximum I/O performance, but has many drawbacks. Designed to be ephemeral.
- Persistent Disk for single-writers with file-based lift and shifts where you don't need absolute maximum performance.

### GCS Storage concerns
**Cold data**
- If objects are accessed once a month or less, but more often than once a year, they should be in Nearline
- If objects are accessed less than once a year, coldline
- Coldline and nearline cost less to store, but more to access, making them more economically feasible for infrequently accessed data.
**Hot Data**
- Multi-regional GCS for objects that must be available globally or in multiple regions.
- Regional for objects that are only access from a single region as it both cheaper and is faster if access is only coming from that region. For something like a GCE instance.

### BigQuery vs. BigTable
- BigQuery is for structured Analytical data. Can use queries on it.
- BigTable is for semi-structured data. Need to know the key to get data. Key-value store

### Resource Annotation types:
- For compliance requirements use Security Marks from Cloud SCC (Security Command Center)
- For billing breakdowns use Labels
- For managing traffic to/from VMs (for load-balancers and the like) use Network Tags
- To monitor resources use monitoring groups and labels

### Anthos
Anthos is essence is essentially on-prem GKE.
- Cloud console view shows and lets you control both your normal GKE clusters in the cloud as well as Anthos clusters.

### Istio
A Layer-3 framework for mangaging, connecting, securing, etc. services. Manages interactios between services.
- Easily centralize logging
- Puts another container 
- Managed version Istio on GKE

### Knative
Serverless framework for kubernetes

### Cloud Run
Fully managed serverless offering that works with knative.
- Stateless containers via HTTP(s) requests.
- Built in Domain Handling
- Scales to zero or infinite
- Can use Cloud Run for Anthos to run cloud run/knative applciations on Anthos Cluster.
- Just managed Knative, so it can taken and run on any major cloud provider.

### Migrate for Anthos
Takes VMs and converts them to containers.

### Cloud Run vs. App Engine
- Cloud run is the newer product and generally seems to be the future of serverless for GCP.
- Cloud run is container based and is portable to any knative cluster, where as App Engine is tied to GCP/appengine
- Cloud run is billed by the millisecond and App engine is billed by the minute

