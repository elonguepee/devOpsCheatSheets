# Terraform Cheat sheet
## A Cheat sheet for terraform with AWS and related topics

### Syntax - Basic
```hcl
resource "aws_instance" "basic-ec2-server" {
    ami           = "ami-0dc2d3e4c0f9ebd18"
    instance_type = "t2.micro"

    tags = {
    #   Name = "Ubuntu"
    }
}
```
An EC2 instance

```hcl
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}
```
A VPC in AWS

```hcl
resource "aws_subnet" "subnet-1" {
  vpc_id     = aws_vpc.test-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "test-subnet"
  }
}
```
A subnet in AWS referencing a vpc

```hcl
resource "aws_internet_gateway" "production-gateway" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}
```
An internet gateway in aws referencing a vpc

``hcl
resource "aws_route_table" "prod-main-route" {
  vpc_id = aws_vpc.prod-vpc.id

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.production-gw.id
  }

  tags = {
    Name = "example"
  }
}
```
A route table with a subnet associated with it