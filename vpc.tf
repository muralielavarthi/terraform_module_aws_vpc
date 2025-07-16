resource "aws_vpc" "my_vpc" {
    cidr_block = var.vpc_cidr
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id
}


resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = var.subnet_cidr
  map_public_ip_on_launch = true
}

resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.my_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
       gateway_id = aws_internet_gateway.igw.id
    }
}

resource "aws_route_table_association" "public_rta" {
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_eip" "eip" {
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.eip.id
  subnet_id = aws_subnet.public_subnet.id
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = var.subnet_cidr
}

resource "aws_route_table" "private_rt" {
    vpc_id = aws_vpc.my_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
       gateway_id = aws_nat_gateway.ngw.id
    }
}

resource "aws_route_table_association" "private_rta" {
  subnet_id = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_rt.id
}

