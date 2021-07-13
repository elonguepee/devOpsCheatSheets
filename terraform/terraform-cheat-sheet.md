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
List | ["string1", "string2"]
map | key1=value1 <br> key2=value2
object | example = { <br> key1 = value1 <br> key2 = value2<br>}
tuple | ["String", 8, false]

#### Life Cycle Rules
Rules that are followed at certain points in a resources lifecylce. Such as create_before_destroy. Which will ensure that a new resource is created to replace the old one before it is destroyed.