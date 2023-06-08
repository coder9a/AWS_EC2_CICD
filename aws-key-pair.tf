resource "tls_private_key" "rsa-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "foo" {
  content  = tls_private_key.rsa-key.private_key_openssh
  filename = "${var.project}_key.pem"
}

resource "aws_key_pair" "key-pair" {
  key_name   = "${var.project}-key"
  public_key = tls_private_key.rsa-key.private_key_openssh
}
