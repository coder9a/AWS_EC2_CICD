output "public_instance_public_ip" {
  description = "public IP of public instance"
  value       = aws_instance.public-instance.public_ip
}

output "public_instance" {
  description = "private IP of public instance"
  value       = aws_instance.public-instance.private_ip
}

output "private_instance" {
  description = "private IP of private instance"
  value       = [for instance in aws_instance.private-instance : instance.private_ip]
}
