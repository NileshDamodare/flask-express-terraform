resource "aws_ecr_repository" "flask_repo" {
  name = "flask-app-repo"
}

resource "aws_ecr_repository" "express_repo" {
  name = "express-app-repo"
}
