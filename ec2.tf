resource "aws_instance" "public-instance" {
  ami                         = var.AWS_AMI
  instance_type               = var.EC2_Instance_Type
  subnet_id                   = aws_subnet.public-subnet.id
  key_name                    = aws_key_pair.key-pair.id
  vpc_security_group_ids      = ["${aws_security_group.public-sg.id}"]
  count                       = length(var.public_instance_name)
  associate_public_ip_address = "true"
  # user_data = file("${path.module}/script.sh")

  provisioner "file" {
    source      = "${var.project}_key.pem"
    destination = "/home/ubuntu/${var.project}_key.pem"
    connection {
      type        = "ssh"
      user        = "ubuntu"
      host        = self.public_ip
      private_key = file("${var.project}_key.pem")
    }
  }
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /home/ubuntu/${var.project}_key.pem",
      "sudo apt update"
    ]
    connection {
      type        = "ssh"
      user        = "ubuntu"
      host        = self.public_ip
      private_key = file("${var.project}_key.pem")
    }
  }
  tags = {
    Name = var.public_instance_name[count.index]
  }
}

resource "aws_instance" "private-instance" {
  ami                    = var.AWS_AMI
  instance_type          = var.EC2_Instance_Type
  subnet_id              = aws_subnet.private-subnet.id
  key_name               = aws_key_pair.key-pair.id
  vpc_security_group_ids = ["${aws_security_group.private-sg.id}"]
  count                  = length(var.private_instance_name)

  provisioner "file" {
    source      = "${var.project}_key.pem"
    destination = "/home/ubuntu/${var.project}_key.pem"

    connection {
      type         = "ssh"
      user         = "ubuntu"
      bastion_host = aws_instance.public-instance[count.index].public_ip
      host         = self.private_ip
      private_key  = file("${var.project}_key.pem")
    }
  }
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /home/ubuntu/${var.project}_key.pem",
      "sudo apt update"
    ]
    connection {
      type         = "ssh"
      user         = "ubuntu"
      bastion_host = aws_instance.public-instance[count.index].public_ip
      host         = self.private_ip
      private_key  = file("${var.project}_key.pem")
    }
  }
  tags = {
    Name = var.private_instance_name[count.index]
  }
}
