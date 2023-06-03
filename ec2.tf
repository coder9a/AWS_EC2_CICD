resource "aws_instance" "public-instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.telescope-public-subnet.id
  key_name               = aws_key_pair.telescope-key-pair.id
  vpc_security_group_ids = ["${aws_security_group.telescope-public-sg.id}"]
  # user_data = file("${path.module}/script.sh")
  tags = {
    Name = "public-instance"
  }
}

resource "aws_instance" "private-instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.telescope-private-subnet.id
  key_name               = aws_key_pair.telescope-key-pair.id
  vpc_security_group_ids = ["${aws_security_group.telescope-private-sg.id}"]

  tags = {
    Name = "public-instance"
  }
}
