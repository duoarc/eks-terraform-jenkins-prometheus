resource "aws_vpc" "alt3-vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "${var.env}-vpc"
  }
}

resource "aws_subnet" "alt3-subnet1" {
  vpc_id            = aws_vpc.alt3-vpc.id
  cidr_block        = var.subnet_cidr_blocks
  availability_zone = var.availability_zone
  tags = {
    Name = "${var.env}-alt3-subnet1"
  }
}

resource "aws_subnet" "subnets" {
  for_each              = var.subnet_cidr_blocks

  vpc_id                = aws_vpc.alt3-vpc.id
  cidr_block            = each.value["cidr"]
  availability_zone     = each.value["az"]

  tags = {
    Name                = each.key
  }
}


resource "aws_internet_gateway" "alt3-igw" {
  vpc_id = aws_vpc.alt3-vpc.id
  tags = {
    Name = "${var.env}-alt3-igw"
  }
}

resource "aws_default_route_table" "alt3-rtb" {
  default_route_table_id = aws_vpc.alt3-vpc.default_route_table_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.alt3-igw.id
  }
  tags = {
    Name = "${var.env}-alt3-rtb"
  }
}

resource "aws_default_security_group" "alt3-sg" {
  vpc_id = aws_vpc.alt3-vpc.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.env}-alt3-sg"
  }
}