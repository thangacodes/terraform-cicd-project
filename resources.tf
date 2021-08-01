resource "aws_instance" "web-cluster" {
  ami = var.ami
  instance_type = var.instancetype
  vpc_security_group_ids = [var.sgp[0]]
  subnet_id = var.subnetid
  tags = {
    Name = var.name
    Purpose = var.purpose
    Tower = var.tower
    Mail = var.mail
  }
}

resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucketname
}
