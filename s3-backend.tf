terraform {
  backend "s3" {
    bucket = "my-terraform-backend-demo"
    key    = "EC2/Dev/ec2.tfstate"
    region = var.region
    dynamodb_table = "tf-s3-locl-table"
   }
}
