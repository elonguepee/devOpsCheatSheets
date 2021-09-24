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

## gcloud
- The command line tool to interact with gcp.
- shares config with gsutil and bq
- In general, CLI tools are more powerful than the console, but less powerful than the REST API

### Basic Syntax for gcloud commands:
```bash
gcloud <global_flags> <service/product> <group/area> <command> <command_flags> <parameters>
```

### GLobal flags
- --help/-h: gets help for command
- --project: specifies project
- --account: specifies account
- --filter: filters data being returned. Not always available, but if it is, usually better than grep.
- --format: Lets you specify format (JSON, YAML, CSV, etc.). Can be useful to pipe into jq for processing.
- --quiet/-q: Won't prompt for destructive actions.

### Configuration properties
To set a config property:
```bash
gcloud config set <property> <value>
```
To get the value for a property:
```bash
gcloud config get-value <property>
```
To unset a config property:
```bash
gcloud config unset <property>
```

### Configurations
Groups of settings you can switch between. Useful when using multiple projects. <br/>
For an interactive workflow to set common properties in a config use command:
```bash
gcloud init
```

To create a new configuration command:
```bash
gcloud config configurations create <config_name>
```

To start using a configuration:
```bash
gcloud config configurations activate <config_name>
```
Can use a configuration for a single command with the global flag --configuration=<config_name>
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

### Compute
#### Instance Templates
Instance templates are exactly what they sounds like: templates for compute engine instances. Some properties of Instance templates are:
- They are global
- They are immutable. You cannot edit them, you must create new ones.

#### Instance Groups
Instance groups are groups of instances. Shocking. Unmanaged instance groups are essentially manual groups of instances. No autoscaling, health checks, etc. Managed instance groups use instance templates to scale up and down instances, do health checks, etc. Some properties of instance groups:
- An unmanaged instance group cannot be multi-zone.

### Security
Identity Products:
- G Suite
- Cloud Identity
- Service Accounts for applications and services
Identity Hierarchy:
- Google Groups

Authorization Products:
- Resource Hierarchy: Organizations, Folders, Projects
- IAM:
  - Permissions
  - Roles
  - Bindings
- GCS ACLs
- Billing Management
- Networking Structures and restrictions

Accounting Products:
- Audit/Activity Logs
- Billing Export:
  - To BigQuery
  - To files in GCS bucket
  - GCS Object Lifecycle Management

#### Resource Hierarchy
- Resource: Something you setup in GCP.
- Projects: Container for a set of resources
- Folder: contains any set of subfolders and projects
- Organization: Tied to G Suite or Cloud Identity Domain

So, an Organization (IE example.com) has folders in it, that have projects in them, that contain resources.

#### Trust Boundary
Resources within a project "trust" eachother. Ex: A GCE instance can read from GCS bucket if they're in the same project by default, but not in other projects.

#### Permissions
- Follow the format: Service.Resource.Verb
- Typically correspond to REST API methods

#### Role
- A collection of permissions to use or manage GCP resources
- Primitive Roles: Defined at project level and usually too broad. They are:
  - Viewer: Read-only
  - Editor: Can view and change things
  - Owner: Can also control access and billing
- Predefined Roles: Give granular access to specific resources
- Custom Roles: Project or Org level collection to define granular permissions

#### Member
- A google-known entity.
- Each member identified by a unique email address.
- Can be:
  - user: a specific google account
    - For people
  - serviceAccount:
    - for apps/services
  - group: Group of google users and service accounts
  - domain: Whole domain managed by G Suite or Cloud Identity
  - allAuthenticatedUsers - Any Google account or service account. Essentially public
  - allUsers - anyone on the internet. Completely anonymous access
- Group should be default choice.

#### Groups
- A named collection of google accounts and service accounts
- Every group has a unique email address associated with the group
- Never act *as* the group
- Can even use groups to be owner of projects when within an organization
- Groups can be nested.

#### Policies
- Policies bind Members to roles for a scope of resources
- Who can do what to which things?
- Can attach policies at Organization, Folder, Project, or resource level
- Where you attach it determines the scope of the resources the policy applies to.
- The policy itself determines what what roles and members it applies to.
- Policies are always additive. Can only add allow, not deny.
- Child Policies cannot restrict access given at a higher level.
- Each resource can only have one policy attached to it.
- Use groups!
- USe granular commands such as add-iam-policy-binding as opposed to editing whole policy. Avoids race conditions, simple, less error prone.

To add a policy binding:
```bash
gcloud <group> add-iam-policy-binding <resource_name> --role <role_id> --member user:[user_email]
```

To remove a policy binding:
```bash
gcloud <group> remove-iam-policy-binding <resource_name> --role <role_id> --member user:[user_email]
```

#### Billing Accounts
- Represents some way to pay for GCP usage.
- A type of resource that lives outside of projects
- Can be owned by an organization inheriting org level IAM policies.
- Can be linked to projects, but doesn't own them and has no affect on project IAM
- A billing account can be linked to multiple projects, but a project can only have one billing account.

#### Billing account Roles.
**Billing Account User**
- A billing account user is a role that can be assigned at the Organization or billing account level. 
- The user with this role can link projects to billing accounts.
**Billing Account Creator**
- Org level
- Can create new billing accounts
**Billing Account Administrator**
- Billing account level
- Can manage billing accounts, but not create them
**Billing Account Viewer**
- Can view cost info and transactions.
**Project Billing Manager**
- Project Level
- Let's you link a billing account to that specific project.
- To link a project to a billing account you need **project billing manager** on the project, and **Billing Account User** on the billing account.

#### Invoice billing
Instead of getting charged at the end of the month, you get a bill that you have to pay.

### Networking
#### Premium vs. Standard Routing Tier
- In the standard tier, once a request is made, traffic enters the Google network in the region of the GCP destination. This means that the traffic will have to make it to the desination region first before entering googles network.
- In the premium network tier, traffic enters the google network in the location closest to the user.
- Additionally with standard routing, the requestor has to know the destination first. With premium routing, A user could enter the google network at a google Point of Presence and then it could be decided that a better endpoint is located closer and that could be used.

#### VPC
- Virtual Private Cloud. Where you define your networking in GCP
- Overall is global.
- Subnets logical spaces for resources. They are regional.
- All subnets can reach all others globally without needing VPNs.

#### Shared VPCs
Within an organization you can share VPC's among projects. One project will own the VPC and other projects will be granted access to all/part of it.

#### Routes 
- Routes define "next hop" for targets based on destination IP.
- Routes are global and are applied by instance-level tags.

#### Firewall Rules
- Global
- Further filter data that would otherwise route.
- Applied by instance-level tags or service accounts.
- Default firewall rules block all data going in and allow all going out.

### App Engine
- Platform as a service that takes code and runs it.
- Natively supports Go, Java, node, and a few others in standard mode.
- Flex mode will run any container you give it.
- Autoscales
- Basically pay for underlying instances.

### Service Summaries

#### Compute
**GKE**
- No management fee, just pay for nodes

**Cloud Functions**
- Runs code in response to an event
- Node, python, go, java
- Like Lambda
- Just pay for how long it runs
- Automatically get an http endpoint, no need to setup API gateway.
- Can trigger based on Cloud Storage events, Pub/sub messages, etc.
- Massively scaleable

#### Storage

**Local SSD**
- Attached to a single specific GCE instance
- Similar to instance store on AWS.
- Very very fast
- 375GB SSD
- Can Stripe across 8 for even better performance
- Data is lost whenever instance shuts down

**Persistent Disk**
- Block storage.
- Default boot for instances
- Like AWS EBS
- Can persist and are replicated for durability
- Can resize while in use, but will need the file system to update within the VM
- Snapshots and machine images add more capability and flexibility
- Not file based, block based.

**Cloud Filestore**
- Fully managed file-based storage
- Like AWS EFS.
- Consistent Performace
- Primary use is for "lift-and-shift" migrations.
- Pay for how much you provision, not how much you use.

**Cloud Storage**
- Object store
- infinitely scaleable
- fully managed
- versioned
- 11 9's availability
- Strongly consistent
- Integrated site hosting and CDN functionality
- Lifecycle transitions like S3
- Difference in storage tiers is availability and cost, not latency. No thaw delay.
- Pay for storage and storage amounts

**Cloud SQL**
- Fully managed MySQL and PostgreSQL
- Like AWS RDS
- Scaling is manual
- Basically pay for underlying GCE instances and Persistent Disks

**Cloud Spanner**
- Horizontally scaleable
- strongly consistent
- Relational database
- Infinitely scaleable
- 5 9s for multi-region
- Pay for provisioned node time plust storage time
- Huge and expensive

**BigQuery**
- Serverless
- column store data warehouse
- Kind of like REdshift, but serverless
- Pay for GBs actually scanned during queries
- Attempts to reuse cached results, which are free.
- Pay for data stored. Relatively inexpensive
- Pay for streaming inserts 

**Cloud Bigtable**
- NoSQL
- Low Latency and high throughput
- For large operational and analytical apps
- For huge loads

**Cloud Datastore**
- Managed and autoscaled NoSQL database
- Like DynamoDB/mongodb

**Firebase Realtime DB and cloud firestore**
- NoSQL document stores with real-time client updates via managed websockets
- Firestore has collections and 

#### Data Transfer
**Data Transfer Appliance**
- A rackable, physical server that you ship to google.
- For ingest only. No egress
- Like snowball
- 100TB or 480TB versions

**Storage Transfer Service**
- Copies objects for you.
- Always to a GCS bucket
- Source can be S3, HTTP(S) Endpoint or another GCS bucket
- One time or scheduled recurring
- Free to use service, but you pay for the actions (data transfer, etc.)

#### External Networking


## Commands
```bash
gcloud config list
```
Lists config data such as project, account being used, etc.

```bash
gsutil ls
```
Lists cloud storage buckets

```bash
gcloud compute instances list
```
Lists instances

```bash
gcloud services list
```
Lists gcloud services for the project. Lists enabled services by default.

```bash
gcloud compute instances create <vmname>
```
Creates a compute instance

```bash
gcloud compute ssh <vmname>
```
SSH to an instance by name

```bash
gcloud auth configure-docker
```
Configures gcp docker registry

```bash
gcloud container clusters get-credentials <cluster-name>
```
Gets the credentials and sets up kubectl for the gke cluster.