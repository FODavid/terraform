
resource "aws_eip" "levelup-nat" {
  domain   = "vpc"
}


resource "aws_nat_gateway" "levelup-nat-gw" {
  allocation_id = aws_eip.levelup-nat.id
  subnet_id     = aws_subnet.levelup_vpc-public-1.id

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.levelup-gw]
   tags = {
    Name = "gw NAT"
  }

}

resource "aws_route_table" "levelup-private" {
  vpc_id = aws_vpc.levelup_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.levelup-nat-gw.id
  }

  tags = {
    Name = "levelup_vpc-private"
  }
}

resource "aws_route_table_association" "level-private-1-a" {
  subnet_id      = aws_subnet.levelup_vpc-private-1.id
  route_table_id = aws_route_table.levelup-private.id
}

resource "aws_route_table_association" "level-private-2-a" {
  subnet_id      = aws_subnet.levelup_vpc-private-2.id
  route_table_id = aws_route_table.levelup-private.id
}

resource "aws_route_table_association" "level-private-3-a" {
  subnet_id      = aws_subnet.levelup_vpc-private-3.id
  route_table_id = aws_route_table.levelup-private.id
}