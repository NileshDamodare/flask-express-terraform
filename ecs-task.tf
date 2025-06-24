resource "aws_ecs_task_definition" "flask_task" {
  family                   = "flask-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = jsonencode([{
    name         = "flask"
    image        = "774305606512.dkr.ecr.ap-south-1.amazonaws.com/flask-app:latest"
    portMappings = [{
      containerPort = 5000
      hostPort      = 5000
    }]
  }])
}

resource "aws_ecs_task_definition" "express_task" {
  family                   = "express-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = jsonencode([{
    name         = "express"
    image        = "774305606512.dkr.ecr.ap-south-1.amazonaws.com/express-app:latest"
    portMappings = [{
      containerPort = 3000
      hostPort      = 3000
    }]
  }])
}
