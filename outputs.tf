output "public-a-public-ip" {
  value = "${aws_instance.public-a.public_ip}"
}

output "public-a-private-ip" {
  value = "${aws_instance.public-a.private_ip}"
}

output "private-a-private-ip" {
  value = "${aws_instance.private-a.private_ip}"
}
