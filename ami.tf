# gimme the latest Ubuntu (Canonical) AMI!
#data "aws_ami" "ubuntu" {
#  most_recent = true
#
#  filter {
#    name   = "name"
#    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
#  }
#
#  filter {
#    name   = "virtualization-type"
#    values = ["hvm"]
#  }
#
#  owners = ["099720109477"] # Canonical
#}

# get ours..
# don't forget to run packer first!
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["packer-ubuntu-with-aws*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["${data.aws_caller_identity.current.account_id}"]
}
