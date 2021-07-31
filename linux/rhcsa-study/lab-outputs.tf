output "lab-public-ip" {
  value = aws_instance.lab-server.public_ip
}
output "lab-public-dns" {
  value = aws_instance.lab-server.public_dns
}