resource "aws_security_group" "sg" {
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags={
    Name="sg"
  }
  vpc_id = aws_vpc.my_vpc.id
}