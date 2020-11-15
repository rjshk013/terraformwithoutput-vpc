################ VPC #################
resource "aws_vpc" "main" {
  cidr_block       = "${var.main_vpc_cidr}"
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "main"
  }
}

 ################# Subnets #############
resource "aws_subnet" "publicsubnet1" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.publicsubnet1}"
  availability_zone = "${var.availability_zone1}"


  tags = {
    Name = "public-subnet-1"
    }
}
resource "aws_subnet" "publicsubnet2" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.publicsubnet2}"
  availability_zone = "${var.availability_zone2}"


  tags = {
    Name = "public-subnet-2"
  }
}
resource "aws_subnet" "publicsubnet3" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.publicsubnet3}"
  availability_zone = "${var.availability_zone3}"


  tags = {
    Name = "public-subnet-3"
  }
}
resource "aws_subnet" "publicsubnet4" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.publicsubnet4}"
  availability_zone = "${var.availability_zone4}"


  tags = {
    Name = "public-subnet-4"
  }
}
resource "aws_subnet" "privatesubnet1" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.privatesubnet1}"
  availability_zone = "${var.availability_zone1}"


  tags = {
    Name = "private-subnet-1"
  }
}
resource "aws_subnet" "privatesubnet2" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.privatesubnet2}"
  availability_zone = "${var.availability_zone2}"


  tags = {
    Name = "private-subnet-2"
  }
}
resource "aws_subnet" "privatesubnet3" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.privatesubnet3}"
  availability_zone = "${var.availability_zone3}"


  tags = {
    Name = "private-subnet-3"
  }
}
resource "aws_subnet" "privatesubnet4" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.privatesubnet4}"
  availability_zone = "${var.availability_zone4}"


  tags = {
    Name = "private-subnet-4"
  }
}

######## IGW ###############
resource "aws_internet_gateway" "main-igw" {
  vpc_id = "${aws_vpc.main.id}"

  tags = {
    Name = "main-igw"
  }
}

########### NAT ##############
resource "aws_eip" "nat" {
}

resource "aws_nat_gateway" "main-natgw" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id     = "${aws_subnet.publicsubnet1.id}"

  tags = {
    Name = "main-nat"
  }
}

############# Route Tables ##########

resource "aws_route_table" "main-public-rt" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.main-igw.id}"
  }

  tags = {
    Name = "main-public-rt"
  }
}

resource "aws_route_table" "main-private-rt" {
  vpc_id = "${aws_vpc.main.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.main-natgw.id}"
  }

  tags = {
    Name = "main-private-rt"
  }
}

######### PUBLIC Subnet assiosation with rotute table    ######
resource "aws_route_table_association" "public-assoc-1" {
  subnet_id      = "${aws_subnet.publicsubnet1.id}"
  route_table_id = "${aws_route_table.main-public-rt.id}"
}
resource "aws_route_table_association" "public-assoc-2" {
  subnet_id      = "${aws_subnet.publicsubnet2.id}"
  route_table_id = "${aws_route_table.main-public-rt.id}"
}
resource "aws_route_table_association" "public-assoc-3" {
  subnet_id      = "${aws_subnet.publicsubnet3.id}"
  route_table_id = "${aws_route_table.main-public-rt.id}"
}
resource "aws_route_table_association" "public-assoc-4" {
  subnet_id      = "${aws_subnet.publicsubnet4.id}"
  route_table_id = "${aws_route_table.main-public-rt.id}"
}

########## PRIVATE Subnets assiosation with rotute table ######
resource "aws_route_table_association" "private-assoc-1" {
  subnet_id      = "${aws_subnet.privatesubnet1.id}"
  route_table_id = "${aws_route_table.main-private-rt.id}"
}
resource "aws_route_table_association" "private-assoc-2" {
  subnet_id      = "${aws_subnet.privatesubnet2.id}"
  route_table_id = "${aws_route_table.main-private-rt.id}"
}
resource "aws_route_table_association" "private-assoc-3" {
  subnet_id      = "${aws_subnet.privatesubnet3.id}"
  route_table_id = "${aws_route_table.main-private-rt.id}"
}
resource "aws_route_table_association" "private-assoc-4" {
  subnet_id      = "${aws_subnet.privatesubnet4.id}"
  route_table_id = "${aws_route_table.main-private-rt.id}"
}
