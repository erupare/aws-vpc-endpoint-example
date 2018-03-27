data "aws_ami" "ubuntu_xenial_lts" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "public-a" {
  ami       = "${data.aws_ami.ubuntu_xenial_lts.id}"
  subnet_id = "${aws_subnet.public-a.id}"

  vpc_security_group_ids = [
    "${aws_security_group.public-access-sg.id}",
  ]

  associate_public_ip_address = "true"
  instance_type               = "t2.nano"
  user_data                   = "${file("userdata-pub.sh")}"
  key_name                    = "${var.ami_key}"

  tags {
    Name = "public-a"
  }
}

resource "aws_instance" "private-a" {
  ami       = "${data.aws_ami.ubuntu_xenial_lts.id}"
  subnet_id = "${aws_subnet.private-a.id}"

  vpc_security_group_ids = [
    "${aws_security_group.private-endpoint-sg.id}",
    "${aws_security_group.private-access-sg.id}",
  ]

  associate_public_ip_address = "false"
  instance_type               = "t2.nano"
  user_data                   = "${file("userdata-priv.sh")}"
  key_name                    = "${var.ami_key}"

  tags {
    Name = "private-a"
  }
}
