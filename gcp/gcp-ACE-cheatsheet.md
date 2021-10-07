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
- Cloud Firestore: Serverless Document DB
- Cloud Datastore: Horizontally Scalable Document DB - Pay for what you use.
- Cloud Bigtable: Petabyte-scale, low-latency nosql

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
**Google Domains**
- Googles Domain Registrar
- Supports DNSSEC

**Cloud DNS**
- Managed DNS
- 100% uptime guarantee
- SUpports DNSSEC
- Low Latency globally
- Pay fixed fee per zone to store and distribute DNS records
- Pay for lookups

**Static IPs**
- Reserve Static IPs in projects and assign them to servers 
- Regional Ips are for GCE instances and Network Load balancers
- Global IPs used for global load balancers
  - Use Anycast IPs
- Pay for reserved IPs that aren't in use to dicourage wasting them.

**Load Balancer**
- Scaleable traffic distribution with autoscaling and Cloud CDN
- Like ELB
- Natually handles spikes without any pre-warning
- No instances or devices provisioned

**Cloud CDN**
- Content delivery from within GCP
- Supports HTTP/S
- Pay for request volume
- Pay per cache invalidation request.

#### Internal Networking
**VPC**
- Global
- IPv4 unicast
- SDN
- Subnets are regional
- Can peer with other VPCs
- VPC is free, but some services aren't (like VPNs)

**Cloud Interconnect**
- Options for connecting external networks to Google's network
- Private connections via Cloud VPN or Dedicated/Partner Interconnect
- Public Google services via External Peering
  - Direct peering for high volume
  - Carrier Peering if low volume via a partner
- Significantly lower egress fees.
  - Except Cloud VPN which is the same

**Cloud VPN**
- IPSec VPN to connect to VPC via public internet for low volume data connections
- For persistent/static connections between gateways (not for dynamic client)
  - Must have a static IP
- Encrypted link to VPC into one subnet

**Dedicated interconnect**
- For high volume link between VPC and on prem
- Linka are private but not encrypted; can layer own encryption
- For critical applications, recommended to have redundant connections in different locations

**Cloud Router**
- Dynamic Routing for hybrid networks linking to GCP
- Works with Cloud VPN and Dedicated interconnect
- Automatically learns subnets in VPC and announces them to on-prem network
- Without cloud router, you must manage static routes for VPN
  - Changing IP addresses on either side requires recreating it
- Free to set up, but pay for VPC egress charges.

**CDN interconnect**
- Direct low-latency connection to certain CDN providers with cheatper egress rates
- For external CDNs not google's Cloud CDN

#### Machine Learning/AI
**Cloud ML Engine**
- Massively scaleable managed service for ML Models
- Enables Tensorflow on datasets of any size
- endless use cases
- Integrates with GCS/BQ, Cloud Datalab, Cloud Dataflow
- Supports Online and batch, prioritizing either latency or job time.
- Can also download models and make predictions anywhere
- Hypertune automatically tunes hyperparameters to avoid manual tweaking
- Pay per hour to train model based on chosen capabilities

**Cloud Vision API**
- Pretrained API
- Classifies images into categories. 
- Finds text
- Detects faces
- Either upload images directly or point to stored images in GCS
- Pay per image
- Pay for certain features

**Cloud Speech API**
- Pre-trained ML model for speech to text
- For pre-recorded or real time audio
- Lot's of cool features. Noisy audio, filtering innappropriate content, etc.
- Pay per 15 seconds of audio

**Cloud Natural Language API**
- Analyzes text for sentiment, intent, content classification and extracts info.
- Pre-trained ML model
- Works with other ML models
- Charged per request of 1000 characters

**Cloud Translation API**
- Translate text among over 100 languages
- Pre trained ML model
- Pay per character processed

**Dialogflow**
- Build conversational interfaces for websites, mobile apps, etc.
- chatbots
- Paid plan is unlimited, but charges per request: more for voice, less for text.

**Cloud video intelligence API**
- Annotates videos in GCS with info about what they contain
- Pretrained model for video scene analysis and subject identification

**Cloud job discovery**
- Helps career sites, company job boards, improve engagement and conversion
- Helps job seekers search job posting databases

#### Big data/IoT
**Cloud IoT Core**
- Fully managed service for IoT devices globally
- Device manager handles device identity, authentication, config, and control
- Protocol bridge is the bridge to Pub/Sub for processing
- Connect securely using IoT MQTT or HTTPS protocols.
- Certificate Authority signed certs can be used to verify device ownership on first contact
- Pay per MB exchanged between devices and IoT Core.

**Cloud Pub/Sub**
- Infinitely scaleable, at least once messaging service for ingestion, decoupling, etc.
- Like SNS by default, but has a polling mode that is like SQS
- Global by default. Can publish and consume anywhere with consistent latency
- Up to 10 MB in size and stored for up to 7 days
- No DLQ
- Push mode delivers to HTTPS endpoints and will succeed on HTTP success status
- Pull mode will hold onto messages until client asks for them
  - Lets clients set the rate of consumption, and supports batch and long-polling
  - long-polling is when a client opens a connection with pub/sub and waits for a message to come through
- Pay for data volume

**Cloud dataprep**
- Explore, clean and prepare data for analysis without running servers
- More for Business analysts, not IT pros.
- "Data Wrangling"
- Source Data from GCS, BigQuery, or file upload.
- To clean up data
- Automatically detects schemas, datatypes, possible joins and anomalies
- Pay for underlying dataflow job, plus management and overhead
- Also pay for other accessed services

**Cloud Dataproc**
- Batch Mapreduce processing via configurable, managed Spark and Hadoop Clusters
- Processing data
- For moving/replacing Spark/Hadoop. Similar to AWS EMR
- Integrated with Cloud Storage, Big Query, Bigtable, and some stackdriver services
- "Image Versioning" switches between different versions of Spark, Hadoop, and other tools
- Pay directly for underlying GCE servers used in Cluster
- Pay a management fee for per VCPU-hour in the cluster
- If building a new spark/hadoop cluster, should use dataflow

**Cloud Dataflow**
- Autoscaled and fully managed batch or stream mapreduce-like processing
- Open Source as Apache Beam
- Autoscales and dynamically redistributes lagging work, mid-job, to optimize runtime
- Integrated with a bunch of stuff
- Basically pay for underlying worker GCE via consolidated charges
  - Pay per second for vCPUs, RAM, PD/PD-SSD

**Cloud datalab**
- Interactive tool for data exploration, analysis, visualization and machine learning
- Uses Jupyter Notebook
- Supports iterative development of data analysis algorithms in Python/SQL/~JS
- Pay for GCE/GAE instance underlying and PD storing notebooks

**Cloud Data studio**
- Big data visualization tool for dashboards/reporting
- Can get data from several places like BigQuery, Cloud SQL, GCS, etc.
- Lot's of chart types and such
- Familiar G Suite sharing and real time collaboration

**Cloud Genomics**
- Query complete Genomic information of Large research projects in seconds
- Process many genomes and experiments in parallel

#### Identity and Access (Core Security)
**Roles**
- Collections of permissions to use or manage GCP resources
- Permissions allow you to perform certain actions
- Permissions usually in the form of service.resource.verb

**Cloud IAM**
- Controls access to GCP resources
- Authorization, not really Authentication/Identity
- Every identity has a unique email account
- Policies bind members to roles at a hierarchy level: Org, folder, project, resource
- Policies say who can do what to which things
- Free to use, just pay for services that are accessed

**Service Account**
- Represent a Google account the represents a application, not a user.
- Use Cloud-platform managed keys whenever possible for GCP
  - Google manages keys and rotation for you

**Cloud Identity**
- Identity as a Service to provision and manage users and groups
- Free Google Accounts for non G-suite users. tied to a verified domain
- Centrally manage all users in Google admin console. Supports Compliance
- Can set up 2-step
- Normal Google accounts that work with stuff like Chrome

**Security Key Enforcement**
- USB or Bluetooth 2-step device
- Eliminates MITM attacks

**Resource Manager**
- Custom Folder Hierarchy for projects
- Organization is root node in heirarchy and folders underneath
- Must have a verified domain setup

**Cloud IAP**
- Identity Aware Proxy
- Guards Apps running on GCP via identity verification, not VPN access
- Based on CLB and IAM. Only allows authenticated and authorized requests through
- Grant access to any IAM entities, incl. groups and service accounts
- Pay for Load Balancing and protocol forwarding, etc.

**Cloud Audit Logging**
- Who did what, where, when within GCP projects
- Admin Activity and System Events are things done by your members
- Access Transparency are things done by Google Support staff
- Both have 400 day retention
- Data Access - Tracking when data is accessed for GCP managed services
  - For 30 days

#### Security Management - Monitoring and Response
**Cloud Armor**
- Edge-level protection against DDOS and other attacks.
- Only for Global load balancers
- Blocked attacks never reach systems
- Can preview effects of changes
- Monthly charge

**Security Scanner**
- Free but limited Google App Engine vulnerability scanner

**Cloud DLP API**
- Finds and optionally redacts sensitive info

**Event Threat Detection**
- Scan logs for suspicious activity
- Can export to BigQuery

**Cloud SCC**
- SIEM software
- Free, but charged for services used such as DLP API if configured

#### Encryption Keys
**Cloud KMS**
- To manage Crypto keys
- Similar to Hashicorp Vault
- Supports Symmetric and asymmetric
- Integrated with IAM and Cloud Audit logging
- Key deletion has 24 hour delay

**Cloud HSM**
- Cloud KMS managed by compliant HSM
- Hosts keys and performs crypto operations
- Let's you meet compliance requirements
- Fully integrated with KMS
- Basically KMS, but more expensive to meet compliance

#### Operations and Management
**Stackdriver**
- Family of services for monitoring/logging
- Stack Driver can track multiple GCP projects, AWS accounts, and other resources
- Usage based pricing

**Stackdriver Monitoring**
- Visibility into performance, uptime, etc.

**Stackdriver Logging**
- For storage and management of logs
- Collection build into some GCP and AWS resources

**Error Reporting**
- Tracks crashes in centralized interface
- Parses Java, python, Javascript, PHP, Ruby, C#, and Go

**Trace**
- Tracks and displays across call tree and timings across distributed systems

**Debugger**
- Grabs program state in live deploys (variables, expression, callstack)
- Source view supports most major git repositories
- Free

**Profiler**
- Continous CPU and Memory Usage profiling
- Use it in prod is recommeded
- Agent-based
- Free

**Deployment Manager**
- Googles IaaC

**Cloud Billing API**
- Programmatically manage billing for GCP projects and get GCP pricing

#### Development and APIs
**Cloud Source Repositories**
- Git repos

**Cloud Build**
- CI/CD service
- Pay per minute

**Container Registry**
- Docker container registry
- Native Docker login support
- Just a layer of GCS. No extra cost

**Cloud Endpoints**
- Handles authorization, moinitoring, logging, and API keys for APIs backed by GCP
- Proxy instances and distibuted and hook into Cloud load balancer
- Pay per call to the API

**Apigee**
- Full Featured API platform

**Testlab for Android**
- Actual Android phones to test against in a data center

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