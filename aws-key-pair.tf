resource "tls_private_key" "dev-rsa-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "foo" {
  content  = tls_private_key.dev-rsa-key.private_key_openssh
  filename = "${Directory_Path}/${var.project}_key.pem"
  file_permission = "0400"
}

resource "aws_key_pair" "key-pair" {
  key_name   = "${var.project}-key"
  public_key = tls_private_key.dev-rsa-key.public_key_openssh
}
