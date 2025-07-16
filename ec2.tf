resource "aws_instance" "this" {
  ami = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [var.sg_id]
  tags ={
    Name="instance-public-subnet"
  }
  subnet_id = aws_subnet.public_subnet.id
}

resource "aws_instance" "this2" {
  ami = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [var.sg_id]
  tags ={
    Name="instance-private-subnet"
  }
  subnet_id = aws_subnet.private_subnet.id
}
