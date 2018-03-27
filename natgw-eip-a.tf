# this is an example if you need to get private items to talk to the internet
#!# resource "aws_eip" "natgw-a" {
#!#   vpc = true
#!# }
#!# 
#!# resource "aws_nat_gateway" "natgw-a" {
#!#   allocation_id = "${aws_eip.natgw-a.id}"
#!#   subnet_id     = "${aws_subnet.private-a.id}"
#!# 
#!#   tags {
#!#     Name = "${var.tag_prefix}-natgw-a"
#!#   }
#!# }
#!# 
#!# resource "aws_route_table" "az-a" {
#!#   vpc_id = "${aws_vpc.the_vpc.id}"
#!# 
#!#   tags {
#!#     Name = "${var.tag_prefix}-rt-natgw-a"
#!#   }
#!# }
#!# 
#!# resource "aws_route" "nategw-a" {
#!#   route_table_id         = "${aws_route_table.az-a.id}"
#!#   destination_cidr_block = "0.0.0.0/0"
#!#   nat_gateway_id         = "${aws_nat_gateway.natgw-a.id}"
#!# }
#!# 
#!# resource "aws_route_table_association" "private-a" {
#!#   subnet_id = "${aws_subnet.private-a.id}"
#!# 
#!#   route_table_id = "${aws_route_table.az-a.id}"
#!# }

