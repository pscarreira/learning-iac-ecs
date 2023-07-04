terraform {
  backend "s3" {
    bucket = "terraform-learning-iac-ecs"
    key    = "prd/terraform.tfstate"
    region = "us-east-1"
  }
}
