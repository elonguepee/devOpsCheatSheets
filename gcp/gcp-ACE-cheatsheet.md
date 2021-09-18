# GCP Associate Cloud Engineer
A cheatsheet/notes for the Associate Cloud Engineer Exam

## Concepts
### Cloud Comparisons
Compared to AWS, Google is a more Dev-focused cloud, being more dev towards ops vs. ops towards dev. Additionally, GCP focuses more on tools that you couldn't reasonably do on your own, whereas AWS focuses on things that you could do, but shouldn't have to.

### Intrinsically Global
GCP is global focused as opposed to AWS which is region-focused. Easier to handle latency and failures in a global way, but more sensitive to multi-region/global failure modes.

### Zones
A group of data centers. Meant to completely be independant of eachother

### Region
A group of zones. They can communicate quickly with one another

### Multi-Region
A group of regions

### Private Global network
GCP's private network of connected multi-regions

### POPs
Points of presence. Network Edges and CDN locations

### Projects
Similar to AWS accounts. Resources are generally owned by an account, although there can be cross-project resources.

## Key Services

### Compute
- Compute Engine: Virtual Machines, Disks, network. Standard servers. Rented by the second - Like AWS EC2s
- Cloud Functions: Event-driven serverless functions - Like AWS Lambda
- Kubernetes Engine: Managed Kubernetes/Containers

### Storage
- Cloud Storage: Object Storage - Like AWS S3
- Nearline: Cloud Object storage, but archival. For occasional access.
- Coldline: Cloud Object storage, but archival. For rare access.
- Persistent Disk: VM-attached disk. Block storage. Like AWS EBS
- Cloud Filestore: NFS storage. Like AWS EFS

### AI and Machine Learning
- Cloud TPU: Specialized Hardare for ML. Tensorflow processing

### Databases
- Cloud SQL: Managed MySQl/PostgreSQL
- Cloud Spanner: Horizontally Scalable Relational DB
- Cloud Firstore: Serverless Document DB
- Cloud Datastore: Horizontally Scalable Document DB - Pay for what you use.
- Cloud Bigtable: Petabyte-scale, low-latency nonrelational

### Data and Analytics
- Cloud Dataflow: Stream/batch data processing
- Cloud Dataproc: Managed Spark and Hadoop
- Google Genomics: Managed Genomics Platform
- Cloud Pub/Sub: Global Real-time Messaging - Can connect almost anything to anything. Like AWS SNS
- Google BigQuery: Data Warehouse/Analytics - Serverless

### Networking Products
- Virtual Private Cloud: Software Defined Networking
- Dedicated Interconnect: Dedicated private network connection
- Cloud NAT: Network Address Translation
- Cloud Load Balancing: Multi-region Load Distribution
- Network Service Tier: Price vs. Performance Tiering
- Cloud Armor: DDoS Protection and WAF
- Cloud CDN: Content Delivery Network
- Cloud DNS: Programmable DNS Serving

### Maangement Tools
- Stackdriver: A family of logging services

### Identity and Security
- Cloud Identity: Manage Users, Devices and Apps
- Cloud IAM: Resource Access Control
- Cloud HSM: Hardware Security Module Service
- Cloud Data Loss Prevention API: Machine Learning to Classify and redact sensitive data.

## Data flows
### 3 core components
- Moving - Network Services
- Processing - Compute Services
- Remembering - Storage Services

## Basic Services Overview
### Storage
#### Cloud Storage:
- Need a bucket to store objects.
- By default all files are private. Need to set it to public

## Commands
```bash
gcloud config list
```
Lists config data such as project, account being used, etc.

```bash
gsutil ls
```
Lists cloud storage buckets