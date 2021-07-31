# This is a lab environment for RHEL in AWS using free-tier a free tier eligible instance. This assumes you have already setup the aws cli and configured it with your access key and secret access key
# The steps to setup the keypair are:
# 1. Create the keypair in the AWS console with the name "rhel-keypair" and download the .pem file. You can use a different name, but you will have to modify the name in the terraform config
# 2. Modify the permissions of the .pem file with chmod 400 path/to/pem/file
# 3. Generate the public key with ssh-keygen -y -f path/to/pem/file
# 4. Take the generated public key and set the public_key variable equal to it in the terraform.tfvars file
# 5. Run terraform import aws_key_pair.lab rhel-keypair
# After those steps are taken, you can run normal terraform steps: init, plan, apply.
# The public ip address and public dns will be output to the console.
# To connect to the instance, use ssh -i path/to/pem/file ec2-user@public-ip
# When done, it is highly recommended to run terraform destroy to take down all of the infrastructure so you are not charged while using it
provider "aws" {
  region = "us-west-1"
}

data "aws_ami" "latest_rhel" {
  most_recent = true
  owners      = ["309956199498"] # RedHat

  filter {
    name   = "name"
    values = ["RHEL_HA-8*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_key_pair" "lab" {
  key_name = "rhel-keypair"
  public_key = var.public_key
}

resource "aws_instance" "lab-server" {
  ami           = data.aws_ami.latest_rhel.image_id
  instance_type = "t2.micro"
  
  security_groups = [ aws_security_group.allow-ssh.name]
  key_name = aws_key_pair.lab.id
  tags = {
    Name = "RHCSA Lab"
  }
}

resource "aws_security_group" "allow-ssh" {
  name        = "allow_ssh"
  description = "Allow ssh traffic from anywhere"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}