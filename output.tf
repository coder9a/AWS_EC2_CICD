output "public_instance_public_ip" {
  description = "Public IP of public instance"
  value       = [for instance in aws_instance.public-instance : instance.public_ip]
}

output "public_instance" {
  description = "Private IP of public instance"
  value       = [for instance in aws_instance.public-instance : instance.private_ip]
}

output "private_instance" {
  description = "Private IP of private instance"
  value       = [for instance in aws_instance.private-instance : instance.private_ip]
}
