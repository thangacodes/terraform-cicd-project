## This is the place, where we are putting the resources that we are going to spin up
resource "aws_instance" "demo-remote" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.sgp[0]]
  key_name               = var.key

  provisioner "file" {
      source = "index.html"
      destination = "/tmp/index.html"

      connection {
        type = "ssh"
        host = self.public_ip
        user = "ec2-user"
        password = ""
        private_key =file ("./admin.pem")
      }
    
  }
  provisioner "remote-exec" {
      inline = [
        "sudo amazon-linux-extras enable nginx1.12",
        "sudo yum -y install nginx",
        "sudo systemctl start nginx",
        "sudo cp /tmp/index.html /usr/share/nginx/html/index.html",
      ]
  }

  tags = {
    Name    = var.name
    Project = var.project
    Owner   = var.owner
    Mail    = var.mail
    Tower   = var.tower
  }
}
