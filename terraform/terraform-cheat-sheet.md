# Terraform Cheat sheet
## A Cheat sheet for terraform commands and terraform related topics

### Commands - Basic
```bash
terraform init
```
initializes any terraform and downloads any providers in config file

```bash
terraform plan
```
Does a "dry run" of code. Shows what will be done when config is created

```bash
terraform apply
```
Runs terraform code to match state to terraform file

```bash
terraform destroy
```
Removes configuration managed by config file

```bash
terraform state list
```
lists current terraform state

```bash
terraform state show <resource.name>
```
shows the state of a specific resource

```bash
terraform refresh
```
refreshes the terraform state

```bash
terraform destroy -target <resource-name>
```
Destroys only targeted resource

```bash
terraform apply -var "<variable>=<variable value>"
```
Runs apply and sets a variable via command line

```bash
terraform apply -var-file "<filename>.tfvars"
```
Runs apply and sets variables based on a specific var file

```bash
terraform output
```
Shows all of the output variables
Can specify a specific variable to get value of that variable specifically

```bash
terraform validate
```
Validate syntax of terraform file

```bash
terraform fmt
```
Formats hcl to make more readable

```bash
terraform show
```
Shows state of terraform
-json for json

```bash
terraform graph
```
Shows dependency graph

```bash
terraform state mv <source> <destination>
```
Can be used to move resources from one state file to another or to rename resources

```bash
terraform state pull
```
Used to pull the state down from a remote

```bash
terraform state rm <resource name>
```
Used to remove a resource from the state so it is no longer managed. The resource is not destroyed, it is just no longer tracked by terraform


### Syntax - Basic
```hcl
resource "<provider>_<resource_type>" "<name>" {
    <config>=<options>
}
```
Basic resource syntax. Name is just scoped to terraform.

```hcl
resource "aws_vpc" "test-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "test"
  }
}

resource "aws_subnet" "subnet-1" {
  vpc_id     = aws_vpc.test-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "test-subnet"
  }
}
```
A subnet referencing a vpc for AWS. This demonstrates how to reference properties of resources in a terraform file

```hcl
resource "aws_eip" "apache-server-eip" {
  vpc                       = true
  network_interface         = aws_network_interface.prod-main-interface.id
  associate_with_private_ip = "10.0.1.50"
  depends_on = [
    aws_internet_gateway.production-gw,
    aws_instance.apache-server
  ]
  tags = {
    "Name" = "apache-server-ip"
  }
}
```
An AWS eip resource demonstrating the depends_on syntax and the list syntax

```hcl
output "server_public_ip" {
    value = aws_eip.apache-server-eip.public_ip
}
```
Syntax for output from terraform apply command

```hcl
variable "subnet-prefix" {
  description = "CIDR block for subnet"
  default = "10.0.1.0/24"
}
```
Syntax for variables. User will be prompted for variable

```hcl
cidr_block = var.subnet-prefix
```
syntax to use a variable

```hcl
data "<provider>_<resource_type>" "<name>" {
    <config>=<options>
}
```
syntax for data source

```hcl
variable "example" {
  default = [
    "example1",
    "example2",
    "example3"
  ]
}

resource "<provider>_<resource_type>" "<name>" {
    name = var.example[count.index]

    count = length(var.filename)
}
```
An example using the count meta-argument length function

```hcl
variable "example" {
  type=set(string)
  default = [
    "example1",
    "example2",
    "example3"
  ]
}

resource "<provider>_<resource_type>" "<name>" {
    name = each.value

    for_each = var.example
}
```
An example for each

```hcl
terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "2.0.0"
    }
  }
}
```
Example syntax for requiring a provider

```hcl
resource "local_file" "file" {
  filename = "/root ${var.filename}"
  content = var.filecontent
}
```
An example of using a variable inline

### Syntax - Intermediate
```hcl
resource "aws_iam_policy" "adminUser" {
  name = "AdminUsers"
  policy = file("admin-policy.json")
}
```
Example syntax for using a file to input into resource

```hcl
resource "aws_iam_policy" "adminUser" {
  name = "AdminUsers"
  policy = <<EOF
  {
    "Version" : "Example"
    "Statement": [
      {
        "Effect": "Allow"
      }
    ]
  }
  EOF
}
```
Example syntax for HEREDOC format to input a file inline.

```hcl
terraform {
  backend "s3" {
    key = "terraform.tfstate"
    region = "us-east-1"
    bucket = "remote-state"
   
  }
}
```
Using remote-state

### Concepts
#### Declarative programming
Terraform coding is done declaratively. Instead of saying how to do create infrastructure, you specify what infrastructure you would like and terraform creates it.

#### Provider
Plugins that allow Terraform to talk to specific APIs. AWS, Azure, etc. When a resource is being declared, the provider is usually the value before the underscore

#### Terraform variables file
Terraform automatically looks for a variables file called terraform.tfvars

#### Variable Types
Variable Type | Example
------------ | -------------
string | "Example"
number | 1
bool | true
any | Can be any data type
list | ["string1", "string2"]
set | Like a list, but cannot contain duplicate elements
map | key1=value1 <br> key2=value2
object | example = { <br> key1 = value1 <br> key2 = value2<br>}
tuple | ["String", 8, false]

#### Life Cycle Rules
Rules that are followed at certain points in a resources lifecylce. Such as create_before_destroy. Which will ensure that a new resource is created to replace the old one before it is destroyed.

#### Data sources
Allow Terraform to read attributes for resources that are provisions outside of terraform's control.

#### Data Sources vs. Resources
A data source can only be read from, while a resources is fully managed by Terraform and can be read, created, modified, etc.

#### For Each Meta argument
Iterates over either a map or a set. Can only iterate over these variable types

#### State Locking
While Terraform is updating configuration of a state, another update operation cannot run. This prevents state from running multiple times against the same configuration.

#### Remote Backend
A remote backend refers to storing the state of a terraform configuration on a remote file storage such as Amazon S3. When a remote backend is configured, terraform will reference and update it when doing operations. This prevents different operations from being run simultaneously.