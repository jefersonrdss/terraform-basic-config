output "dev" {
  value = aws_instance.dev1.public_ip
}

output "prod" {
  value = aws_instance.prod1.public_ip
}