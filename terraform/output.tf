output "flask_public_ip" {
  description = "The public IP of the Flask App EC2 instance"
  value       = aws_instance.flask_app.public_ip
}
