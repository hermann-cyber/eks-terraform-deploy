terraform {
  required_version = ">=0.12.0"
  backend "s3" {
    key            = "infra/terraform.state"
    bucket         = "c36-terraform-backend-bucket"
    region         = "us-east-2"
    dynamodb_table = "c36-terraform-state-locking"
  }
}