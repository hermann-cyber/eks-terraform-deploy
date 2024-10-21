terraform {
  required_version = ">=0.12.0"
  backend "s3" {
    key            = "infra/terraform.state"
    bucket         = "eks36-terraform-backend-bucket"
    region         = "us-west-2"
    dynamodb_table = "eks36-terraform-state-locking"
  }
}