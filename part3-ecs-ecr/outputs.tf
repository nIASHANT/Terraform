output "alb_url" {
  value = "http://${aws_lb.main.dns_name}"
}

output "flask_ecr" {
  value = aws_ecr_repository.flask.repository_url
}

output "express_ecr" {
  value = aws_ecr_repository.express.repository_url
}