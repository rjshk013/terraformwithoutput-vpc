output "aws_vpc_id" {
  value = "${aws_vpc.main.id}"
}
output "aws_security_gr_id" {
  value = "${aws_security_group.webserver-sg.id}"
}
output "aws_subnet_publicsubnet1" {
  value = "${aws_subnet.publicsubnet1.id}"
}
output "aws_subnet_publicsubnet2" {
  value = "${aws_subnet.publicsubnet2.id}"
}
output "aws_subnet_publicsubnet3" {
  value = "${aws_subnet.publicsubnet3.id}"
}
output "aws_subnet_publicsubnet4" {
  value = "${aws_subnet.publicsubnet4.id}"
}
output "aws_subnet_privatesubnet1" {
  value = "${aws_subnet.privatesubnet1.id}"
}
output "aws_subnet_privatesubnet2" {
  value = "${aws_subnet.privatesubnet2.id}"
}
output "aws_subnet_privatesubnet3" {
  value = "${aws_subnet.privatesubnet3.id}"
}
output "aws_subnet_privatesubnet4" {
  value = "${aws_subnet.privatesubnet4.id}"
}
output "instance_id_list"     { value = ["${aws_instance.web-server1.*.id}"] }
output "ip" {
  value = "${aws_instance.web-server1.*.public_ip}"
}
output "instance_id_list2"     { value = ["${aws_instance.web-server2.*.id}"] }
output "ip2" {
  value = "${aws_instance.web-server2.*.public_ip}"
}
