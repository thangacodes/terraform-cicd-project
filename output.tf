output "instance-state" {
  value = aws_instance.demo-remote.instance_state
}

output "instance-id" {
  value = aws_instance.demo-remote.id
}

output "public-ip" {
  value = aws_instance.demo-remote.public_ip
}

output "private-ip" {
  value = aws_instance.demo-remote.private_ip
}
output "public-dns" {
  value = aws_instance.demo-remote.public_dns
}

output "instance-type" {
  value = aws_instance.demo-remote.instance_type
}

output "instance-sgp" {
  value = aws_instance.demo-remote.vpc_security_group_ids
}

output "instance-az" {
  value = aws_instance.demo-remote.availability_zone
}

output "instance-monitoring" {
  value = aws_instance.demo-remote.monitoring
}
