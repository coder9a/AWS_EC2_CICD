output "public_instance_public_ip" {
  description = "public IP of public instance"
  value       = aws_instance.public_instance.public_ip
}

output "public_instance" {
  description = "private IP of public instance"
  value       = aws_instance.public_instance.private_ip
}

output "private_instance" {
  description = "private IP of private instance"
  value       = aws_instance.private_instance.private_ip
}
