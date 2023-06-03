resource "tls_private_key" "rsa-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "foo" {
  content  = tls_private_key.rsa-key.private_key_openssh
  filename = "telescope_key.pem"
}

resource "aws_key_pair" "telescope-key-pair" {
  key_name   = "telescope-key"
  public_key = tls_private_key.rsa-key.private_key_openssh
}
