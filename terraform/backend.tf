terraform {
  backend "s3" {
    bucket  = "prince-devops-blogging-tfstate"
    key     = "devops-blogging-app/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
    dynamodb_table = "terraform-state-lock"
  }
}
