# REMEMBER: TO TEST YOU WILL NEED awscli INSTALLED
# see packer file

resource "aws_instance" "public-a" {
  ami       = "${data.aws_ami.ubuntu.id}"
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
  ami       = "${data.aws_ami.ubuntu.id}"
  subnet_id = "${aws_subnet.private-a.id}"

  vpc_security_group_ids = [
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
