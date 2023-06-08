resource "aws_instance" "public-instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public-subnet.id
  key_name               = aws_key_pair.key-pair.id
  vpc_security_group_ids = ["${aws_security_group.public-sg.id}"]
  # user_data = file("${path.module}/script.sh")
  tags = {
    Name = "public-instance"
  }
}

resource "aws_instance" "private-instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private-subnet.id
  key_name               = aws_key_pair.key-pair.id
  vpc_security_group_ids = ["${aws_security_group.private-sg.id}"]

  tags = {
    Name = "public-instance"
  }
}
