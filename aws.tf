provider "aws" {
  region  = "${var.aws_region}"
  version = "~> 1.60"
}

data "aws_caller_identity" "current" {}
