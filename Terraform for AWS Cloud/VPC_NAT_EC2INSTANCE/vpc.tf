

#Creating AWS VPC Resource
resource "aws_vpc" "levelup_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
  enable_classiclink = "false"
 
  tags = {
    Name = "levelup_vpc"
  }
}

resource "aws_subnet" "levelup_vpc-public-1" {
  vpc_id     = aws_vpc.levelup_vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1a"

  tags = {
    Name = "levelup_vpc-public-1"
  }
}

resource "aws_subnet" "levelup_vpc-public-2" {
  vpc_id     = aws_vpc.levelup_vpc.id
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1b"

  tags = {
    Name = "levelup_vpc-public-2"
  }
}


resource "aws_subnet" "levelup_vpc-public-3" {
  vpc_id     = aws_vpc.levelup_vpc.id
  cidr_block = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1c"

  tags = {
    Name = "levelup_vpc-public-3"
  }
}

#Private Subnets in Custom VPC
resource "aws_subnet" "levelup_vpc-private-1" {
  vpc_id     = aws_vpc.levelup_vpc.id
  cidr_block = "10.0.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone = "us-east-1a"

  tags = {
    Name = "levelup_vpc-private-1"
  }
}

resource "aws_subnet" "levelup_vpc-private-2" {
  vpc_id     = aws_vpc.levelup_vpc.id
  cidr_block = "10.0.5.0/24"
  map_public_ip_on_launch = "false"
  availability_zone = "us-east-1b"

  tags = {
    Name = "levelup_vpc-private-2"
  }
}


resource "aws_subnet" "levelup_vpc-private-3" {
  vpc_id     = aws_vpc.levelup_vpc.id
  cidr_block = "10.0.6.0/24"
  map_public_ip_on_launch = "false"
  availability_zone = "us-east-1c"

  tags = {
    Name = "levelup_vpc-private-3"
  }
}

#Custom Internet Gateway
resource "aws_internet_gateway" "levelup-gw" {
  vpc_id = aws_vpc.levelup_vpc.id

  tags = {
    Name = "levelup-gw"
  }
}

#Custom Route Table

resource "aws_route_table" "levelup-public" {
  vpc_id = aws_vpc.levelup_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.levelup-gw.id
  }

  tags = {
    Name = "levelup_vpc-public-1"
  }
}


resource "aws_route_table_association" "levelup_vpc-public-1-a" {
  subnet_id      = aws_subnet.levelup_vpc-public-1.id
  route_table_id = aws_route_table.levelup-public.id
}


resource "aws_route_table_association" "levelup_vpc-public-2-a" {
  subnet_id      = aws_subnet.levelup_vpc-public-2.id
  route_table_id = aws_route_table.levelup-public.id
}

resource "aws_route_table_association" "levelup_vpc-public-3-a" {
  subnet_id      = aws_subnet.levelup_vpc-public-3.id
  route_table_id = aws_route_table.levelup-public.id
}