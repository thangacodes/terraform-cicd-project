resource "aws_instance" "app-node" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.sgp[0]]
  subnet_id              = var.subnet_id
  key_name               = var.key_name
  tags = {
    Name    = var.name
    Env     = var.env
    Project = var.project
    Tower   = var.tower
    Owner   = var.owner
  }

  provisioner "remote-exec" {
    inline = ["echo 'Wait until SSH is ready'"]
    connection {
      type = "ssh"
      user = "ec2-user"
      private_key = file("/home/centos/ondot.pem")
      host = aws_instance.app-node.public_ip
  }
}
  provisioner "local-exec" {
    command = "ansible-playbook -i ${aws_instance.app-node.public_ip}, --private-key /home/centos/ondot.pem /home/centos/remote-local-provisioner/httpd-install.yaml"
}
}
