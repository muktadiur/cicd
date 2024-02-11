# Create VPC
resource "aws_vpc" "vpc" {
  cidr_block = "${var.vpc-cidr}"
  enable_dns_hostnames = true
  tags = {
    Name = "Clark VPC"
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "igw"
  }
}

# Create public subnet 1

resource "aws_subnet" "public-subnet-1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "${var.public-subnet-1-cidr}"
  availability_zone = "${var.availability-zone-1}"
  map_public_ip_on_launch = true
  tags = {
    Name = "public subnet 1"
  }
}

# Create public subnet 2
resource "aws_subnet" "public-subnet-2" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "${var.public-subnet-2-cidr}"
  availability_zone = "${var.availability-zone-2}"
  map_public_ip_on_launch = true
  tags = {
    Name = "public subnet 2"
  }
}


# Create Route Table
resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "public route table"
  }
}

# Associate public subnet 1 with public route table
resource "aws_route_table_association" "public-subnet-1-association" {
  subnet_id = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.public-route-table.id
}

# Associate public subnet 2 with public route table
resource "aws_route_table_association" "public-subnet-2-association" {
  subnet_id = aws_subnet.public-subnet-2.id
  route_table_id = aws_route_table.public-route-table.id
}

# Create private subnet 1
resource "aws_subnet" "private-subnet-1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "${var.private-subnet-1-cidr}"
  availability_zone = "${var.availability-zone-1}"
  map_public_ip_on_launch = false
  tags = {
    Name = "private subnet 1 | app"
  }
}

# Create private subnet 2
resource "aws_subnet" "private-subnet-2" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "${var.private-subnet-2-cidr}"
  availability_zone = "${var.availability-zone-1}"
  map_public_ip_on_launch = false
  tags = {
    Name = "private subnet 2 | db"
  }
}

# Create private subnet 3
resource "aws_subnet" "private-subnet-3" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "${var.private-subnet-3-cidr}"
  availability_zone = "${var.availability-zone-2}"
  map_public_ip_on_launch = false
  tags = {
    Name = "private subnet 3 | app"
  }
}

# Create private subnet 4
resource "aws_subnet" "private-subnet-4" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "${var.private-subnet-4-cidr}"
  availability_zone = "${var.availability-zone-2}"
  map_public_ip_on_launch = false
  tags = {
    Name = "private subnet 4 | db"
  }
}




