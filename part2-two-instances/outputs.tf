output "flask_url" {
  value = "http://${aws_instance.flask.public_ip}:5000"
}

output "express_url" {
  value = "http://${aws_instance.express.public_ip}:3000"
}