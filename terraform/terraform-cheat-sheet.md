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

### Concepts
#### Declarative programming
Terraform coding is done declaratively. Instead of saying how to do create infrastructure, you specify what infrastructure you would like and terraform creates it.

#### Provider
Plugins that allow Terraform to talk to specific APIs. AWS, Azure, etc.