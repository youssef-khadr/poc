provider "aws" {
  region     = "us-east-1"
}
data "aws_caller_identity" "current" {
}
data "aws_region" "current" {

}
terraform {
    backend "s3" {
      encrypt = true
      bucket = "ifbi-poc-terraform"
      key = "path/path/terraform.tfstate"
      region = "${data.aws_region.current.name}"
  }
}
output "awsRegion" {
  value = "${data.aws_region.current.name}"
}