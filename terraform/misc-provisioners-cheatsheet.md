# Misc. Provisioners for Terraform Cheatsheet
## A Cheat sheet for syntax and related topics for miscellaneous provisioners for terraform

### Syntax Examples
```hcl
resource "aws_instance" "webserver" {
    ami           = "ami-0dc2d3e4c0f9ebd18"
    instance_type = "t2.micro"
    provisioner "remote-exec" {
        inline = [
            "sudo apt update",
            "sudo apt install nginx -y",
            "sudo systemctl enable nginx",
            "sudo systemctl start nginx"
        ]
    }
    connection {
        type = "ssh"
        host = self.public_ip
        user = "ubuntu"
        private_key = file("/root/.ssh/web")
    }

    key_name = aws_key_pair.web.id
    vpc_security_group_ids = [
        aws_security_group.ssh-access.id
    ]
}
```
An example using remote exec provisioner to install and start a nginx server on an ec2-instance

```hcl
resource "aws_instance" "webserver" {
    ami           = "ami-0dc2d3e4c0f9ebd18"
    instance_type = "t2.micro"
    provisioner "local-exec" {
        command = "echo ${aws_instance.webserver2.public_ip} >> /tmp/ips.txt"
    }
}
```
An example of local exec.
### Provisioners and topics
#### Remote Exec
A provisioner for executing code remotely on a server

#### Local Exec
A provisioner for executing code locally