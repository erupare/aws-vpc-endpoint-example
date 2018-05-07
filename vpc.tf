# make a VPC

resource "aws_vpc" "the_vpc" {
  cidr_block                       = "${var.first-2-octets}.0.0/16"
  enable_dns_hostnames             = "true"
  enable_dns_support               = "true"
  assign_generated_ipv6_cidr_block = "true"

  tags {
    Name = "${var.tag_prefix}-vpc"
  }
}

# make an internet gateway

resource "aws_internet_gateway" "the_vpc_igw" {
  vpc_id = "${aws_vpc.the_vpc.id}"

  tags {
    Name = "${var.tag_prefix}-igw"
  }
}

# route access to the internet through IGW

resource "aws_route" "internet_access" {
  route_table_id         = "${aws_vpc.the_vpc.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.the_vpc_igw.id}"
}

# create vpc-endpoint for EC2

resource "aws_vpc_endpoint" "ec2" {
  vpc_id              = "${aws_vpc.the_vpc.id}"
  service_name        = "com.amazonaws.${var.aws_region}.ec2"
  private_dns_enabled = "true"
  vpc_endpoint_type   = "Interface"

  security_group_ids = [
    "${aws_security_group.private-endpoint-sg.id}",
  ]

  subnet_ids = [
    "${aws_subnet.private-a.id}",
    "${aws_subnet.private-b.id}",
    "${aws_subnet.private-c.id}",
  ]
}

# create vpc-endpoint for S3
# this wasn't tested and it fails as it should until it is tested

resource "aws_vpc_endpoint" "s3" {
  vpc_id              = "${aws_vpc.the_vpc.id}"
  service_name        = "com.amazonaws.${var.aws_region}.s3"
#  private_dns_enabled = "true"
#  vpc_endpoint_type   = "Gateway"
#
#  security_group_ids = [
#    "${aws_security_group.private-endpoint-sg.id}",
#  ]
}
