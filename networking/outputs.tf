output "public_subnet" {
  value = "${aws_subnet.tf_public_subnet.*.id}"
}

output "public_sg" {
  value = "${aws_security_group.tf_public_sg.id}"
}

output "subnets_ips" {
  value = "${aws_subnet.tf_public_subnet.*.cidr_block}"
}
