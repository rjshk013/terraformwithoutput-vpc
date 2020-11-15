variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "aws_region" {
    description = "EC2 Region for the VPC"
    default = "us-east-1"
}
variable "availability_zone1" {
    description = "Avaialbility Zones"
    default = "us-east-1a"
}

variable "availability_zone2" {
    description = "Avaialbility Zones"
    default = "us-east-1b"
}
variable "availability_zone3" {
    description = "Avaialbility Zones"
    default = "us-east-1c"
}
variable "availability_zone4" {
    description = "Avaialbility Zones"
    default = "us-east-1c"
}

variable "main_vpc_cidr" {
    description = "CIDR of the VPC"
    default = "10.0.0.0/16"
}
variable "publicsubnet1" {
    description = "CIDR of the publicsubnet1"
    default = "10.0.1.0/24"
}
variable "publicsubnet2" {
    description = "CIDR of the publicsubnet2"
    default = "10.0.2.0/24"
}
variable "publicsubnet3" {
    description = "CIDR of the publicsubnet3"
    default = "10.0.3.0/24"
}
variable "publicsubnet4" {
    description = "CIDR of the publicsubnet4"
    default = "10.0.4.0/24"
}
variable "privatesubnet1" {
    description = "CIDR of the privatesubnet1"
    default = "10.0.5.0/24"
}
variable "privatesubnet2" {
    description = "CIDR of the privatesubnet2"
    default = "10.0.6.0/24"
}
variable "privatesubnet3" {
    description = "CIDR of the privatesubnet3"
    default = "10.0.7.0/24"
}
variable "privatesubnet4" {
    description = "CIDR of the privatesubnet4"
    default = "10.0.8.0/24"
}

variable "instance_ami" {
  description = "AMI for aws EC2 instance"
  default = "ami-0947d2ba12ee1ff75"
}
variable "instance_type" {
  description = "type for aws EC2 instance"
  default = "t2.micro"
}
variable "key_name" {
  description = "Public key path"
  default     = "testebs"
}
variable "environment_tag" {
  description = "Environment tag"
  default     = "Production"
}


