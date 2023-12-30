resource "aws_instance" "public-instance" {
  ami                         = var.AWS_AMI
  instance_type               = var.EC2_Instance_Type
  subnet_id                   = aws_subnet.public-subnet.id
  key_name                    = aws_key_pair.key-pair.id
  vpc_security_group_ids      = ["${aws_security_group.public-sg.id}"]
  count                       = var.Public_Instance_Count
  associate_public_ip_address = "true"
  # user_data = file("${path.module}/script.sh")

  provisioner "file" {
    source      = "${var.project}-key.pem"
    destination = "/home/ubuntu/${var.project}-key.pem"
    connection {
      type        = "ssh"
      user        = "ubuntu"
      host        = self.public_ip
      private_key = file("${var.project}-key.pem")
    }
  }
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /home/ubuntu/${var.project}-key.pem",
      "sudo apt update -y"
    ]
    connection {
      type        = "ssh"
      user        = "ubuntu"
      host        = self.public_ip
      private_key = file("${var.project}-key.pem")
    }
  }
  tags = {
    Name = var.Public_Instance_Name[count.index]
  }
}

resource "aws_instance" "private-instance" {
  ami                    = var.AWS_AMI
  instance_type          = var.EC2_Instance_Type
  subnet_id              = aws_subnet.private-subnet.id
  key_name               = aws_key_pair.key-pair.id
  vpc_security_group_ids = ["${aws_security_group.private-sg.id}"]
  count                  = var.Private_Instance_Count

  provisioner "file" {
    source      = "${var.project}-key.pem"
    destination = "/home/ubuntu/${var.project}-key.pem"

    connection {
      type         = "ssh"
      user         = "ubuntu"
      bastion_host = aws_instance.public-instance[count.index].public_ip
      host         = self.private_ip
      private_key  = file("${var.project}-key.pem")
    }
  }
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /home/ubuntu/${var.project}-key.pem",
      "sudo apt update -y"
    ]
    connection {
      type         = "ssh"
      user         = "ubuntu"
      bastion_host = aws_instance.public-instance[count.index].public_ip
      host         = self.private_ip
      private_key  = file("${var.project}-key.pem")
    }
  }
  tags = {
    Name = var.Private_Instance_Name[count.index]
  }
}