resource "aws_instance" "web-server1" {
    ami = "${var.instance_ami}"
    instance_type = "${var.instance_type}"
    vpc_security_group_ids = [ "${aws_security_group.webserver-sg.id}" ]
    subnet_id     = "${aws_subnet.publicsubnet2.id}"
    key_name               = "${var.key_name}"
    count         = 1
    associate_public_ip_address = true
    tags = {
      Name              = "web-server1"
      "Environment" = var.environment_tag

    }
volume_tags = {
    Name = "web-server1-vol"
  }
}
resource "aws_instance" "web-server2" {
    ami = "${var.instance_ami}"
    instance_type = "${var.instance_type}"
    vpc_security_group_ids = [ "${aws_security_group.webserver-sg.id}" ]
    subnet_id     = "${aws_subnet.publicsubnet1.id}"
    key_name               = "${var.key_name}"
    count         = 1
    associate_public_ip_address = true
    tags = {
      Name              = "web-server2"
      "Environment" = var.environment_tag

    }
}
