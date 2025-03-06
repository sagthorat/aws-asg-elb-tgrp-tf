

### network.tf

resource "aws_vpc" "vpc1" {
  cidr_block           = "10.16.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "vpc1"
  }
}

resource "aws_internet_gateway" "vpc1_igw" {
  vpc_id = aws_vpc.vpc1.id
  tags = {
    Name = "vpc1-igw"
  }
}

resource "aws_subnet" "sn_public_a" {
  vpc_id                  = aws_vpc.vpc1.id
  cidr_block              = "10.16.1.0/24"
  availability_zone       = "us-west-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "sn-public-a"
  }
}

resource "aws_subnet" "sn_public_b" {
  vpc_id                  = aws_vpc.vpc1.id
  cidr_block              = "10.16.2.0/24"
  availability_zone       = "us-west-2b"
  map_public_ip_on_launch = true
  tags = {
    Name = "sn-public-b"
  }
}

resource "aws_subnet" "sn_public_c" {
  vpc_id                  = aws_vpc.vpc1.id
  cidr_block              = "10.16.3.0/24"
  availability_zone       = "us-west-2c"
  map_public_ip_on_launch = true
  tags = {
    Name = "sn-public-c"
  }
}

resource "aws_route_table" "vpc1_rt_web" {
  vpc_id = aws_vpc.vpc1.id
  tags = {
    Name = "vpc1-rt-web"
  }
}

resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.vpc1_rt_web.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vpc1_igw.id
}