# Allocate Elastic IP 1
resource "aws_eip" "eip-nat-1" {
  vpc      = true
  tags = {
    Name = "eip-nat-1"
  } 
}

# Allocate Elastic IP 2
resource "aws_eip" "eip-nat-2" {
  vpc      = true
  tags = {
    Name = "eip-nat-2"
  } 
}

# Create a NAT Gateway 1
resource "aws_nat_gateway" "nat-gateway-1" {
  allocation_id = aws_eip.eip-nat-1.id
  subnet_id     = aws_subnet.public-subnet-1.id
  tags = {
    Name = "nat-gateway public-subnet-1"
  }
} 

# Create a NAT Gateway 2
resource "aws_nat_gateway" "nat-gateway-2" {
  allocation_id = aws_eip.eip-nat-2.id
  subnet_id     = aws_subnet.public-subnet-2.id
  tags = {
    Name = "nat-gateway public-subnet-2"
  }
}

# Create a Route Table for private route table 1
resource "aws_route_table" "private-route-table-1" {
  vpc_id = aws_vpc.vpc.id
  
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gateway-1.id
  }
  tags = {
    Name = "private-route-table-1"
  }
}

# Associate the private route table with the private subnet 1
resource "aws_route_table_association" "private-route-table-association-1" {
  subnet_id      = aws_subnet.private-subnet-1.id
  route_table_id = aws_route_table.private-route-table-1.id
}

# Associate the private route table with the private subnet 2
resource "aws_route_table_association" "private-route-table-association-2" {
  subnet_id      = aws_subnet.private-subnet-2.id
  route_table_id = aws_route_table.private-route-table-1.id
}

# Create a Route Table for private route table 2
resource "aws_route_table" "private-route-table-2" {
  vpc_id = aws_vpc.vpc.id
  
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gateway-2.id
  }
  tags = {
    Name = "private-route-table-2"
  }
}

# Associate the private route table with the private subnet 3
resource "aws_route_table_association" "private-route-table-association-3" {
  subnet_id      = aws_subnet.private-subnet-3.id
  route_table_id = aws_route_table.private-route-table-2.id
}

# Associate the private route table with the private subnet 4
resource "aws_route_table_association" "private-route-table-association-4" {
  subnet_id      = aws_subnet.private-subnet-4.id
  route_table_id = aws_route_table.private-route-table-2.id
}




