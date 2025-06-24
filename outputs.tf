output "flask_instance_public_ip" {
  description = "Public IP of Flask backend instance"
  value       = aws_instance.flask_instance.public_ip
}

output "express_instance_public_ip" {
  description = "Public IP of Express frontend instance"
  value       = aws_instance.express_instance.public_ip
}

output "flask_url" {
  value = "http://${aws_instance.flask_instance.public_ip}:5000"
}

output "express_url" {
  value = "http://${aws_instance.express_instance.public_ip}:3000"
}
