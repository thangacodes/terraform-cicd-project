### Declaring output values

output "app-node-public_ip" {
  value = aws_instance.app-node.public_ip
}

output "app-node-private_ip" {
  value = aws_instance.app-node.private_ip
}
