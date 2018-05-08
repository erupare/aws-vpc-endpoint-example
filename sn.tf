resource "aws_subnet" "public-a" {
  vpc_id                  = "${aws_vpc.the_vpc.id}"
  cidr_block              = "${var.first-2-octets}.0.0/21"
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = "false"

  tags {
    Name = "${var.tag_prefix}-public-a"
  }
}

resource "aws_subnet" "public-b" {
  vpc_id                  = "${aws_vpc.the_vpc.id}"
  cidr_block              = "${var.first-2-octets}.8.0/21"
  availability_zone       = "${var.aws_region}b"
  map_public_ip_on_launch = "false"

  tags {
    Name = "${var.tag_prefix}-public-b"
  }
}

resource "aws_subnet" "public-c" {
  vpc_id                  = "${aws_vpc.the_vpc.id}"
  cidr_block              = "${var.first-2-octets}.16.0/21"
  availability_zone       = "${var.aws_region}c"
  map_public_ip_on_launch = "false"

  tags {
    Name = "${var.tag_prefix}-public-c"
  }
}

resource "aws_subnet" "packer-a" {
  vpc_id                  = "${aws_vpc.the_vpc.id}"
  cidr_block              = "${var.first-2-octets}.32.0/21"
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = "true"

  tags {
    Name = "${var.tag_prefix}-packer-a"
  }
}

resource "aws_subnet" "private-a" {
  vpc_id                  = "${aws_vpc.the_vpc.id}"
  cidr_block              = "${var.first-2-octets}.128.0/20"
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = "false"

  tags {
    Name = "${var.tag_prefix}-private-a"
  }
}

resource "aws_subnet" "private-b" {
  vpc_id                  = "${aws_vpc.the_vpc.id}"
  cidr_block              = "${var.first-2-octets}.144.0/20"
  availability_zone       = "${var.aws_region}b"
  map_public_ip_on_launch = "false"

  tags {
    Name = "${var.tag_prefix}-private-b"
  }
}

resource "aws_subnet" "private-c" {
  vpc_id                  = "${aws_vpc.the_vpc.id}"
  cidr_block              = "${var.first-2-octets}.160.0/20"
  availability_zone       = "${var.aws_region}c"
  map_public_ip_on_launch = "false"

  tags {
    Name = "${var.tag_prefix}-private-c"
  }
}
