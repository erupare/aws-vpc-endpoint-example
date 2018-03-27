# allow ingress to instance over ssh from 'home-ip', ping from the internet
# allow egress from instance to anything

resource "aws_security_group" "public-access-sg" {
  name        = "public access security group"
  description = "public access security group"
  vpc_id      = "${aws_vpc.the_vpc.id}"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "${var.first-2-octets}.0.0/16",
      "${var.home-ip}",
    ]
  }

  ingress {
    from_port = -1
    to_port   = -1
    protocol  = "icmp"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }

  egress {
    from_port = -1
    to_port   = -1
    protocol  = "icmp"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }

  tags {
    Name = "public-access-sg"
  }
}

# allow ingress and egress to the private-endpoint

resource "aws_security_group" "private-endpoint-sg" {
  name        = "private endpoint security group"
  description = "private endpoint security group"
  vpc_id      = "${aws_vpc.the_vpc.id}"

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"

    cidr_blocks = [
      "${var.first-2-octets}.0.0/16",
    ]
  }

  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"

    cidr_blocks = [
      "${var.first-2-octets}.0.0/16",
    ]
  }

  tags {
    Name = "private-endpoint-sg"
  }
}

# allow ingress and egress to the private instance(s)

resource "aws_security_group" "private-access-sg" {
  name        = "private access security group"
  description = "private access security group"
  vpc_id      = "${aws_vpc.the_vpc.id}"

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = [
      "${var.first-2-octets}.0.0/16",
    ]
  }

  ingress {
    from_port = -1
    to_port   = -1
    protocol  = "icmp"

    cidr_blocks = [
      "${var.first-2-octets}.0.0/16",
    ]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = [
      "${var.first-2-octets}.0.0/16",
    ]
  }

  egress {
    from_port = -1
    to_port   = -1
    protocol  = "icmp"

    cidr_blocks = [
      "${var.first-2-octets}.0.0/16",
    ]
  }

  tags {
    Name = "private-access-sg"
  }
}
