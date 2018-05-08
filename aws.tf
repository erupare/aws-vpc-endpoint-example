provider "aws" {
  region  = "${var.aws_region}"
  version = "~> 1.17"
}

data "aws_caller_identity" "current" {}
