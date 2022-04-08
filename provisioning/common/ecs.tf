resource "aws_ecs_cluster" "sample-node-app-cluster" {
    name = local.ecs_cluster_name
    tags = merge(local.tags, {
        Name = local.ecs_cluster_name
    })
}

resource "aws_ecs_task_definition" "sample-node-app-task" { 
    family = "node-app"
    requires_compatibilities = ["FARGATE"]
    network_mode          = "awsvpc"
    cpu                   = 512
    memory                = 1024
    tags                  = local.tags
    execution_role_arn    = aws_iam_role.ecs_task_execution_role.arn
    container_definitions = <<DEFINITION
    [
        {
            "name": "sample-node-app",
            "image": "${var.app_image}:latest",
            "essential": true,
            "portMappings": [
                {
                    "containerPort": ${var.app_port},
                    "hostPort": ${var.app_port}
                }
            ],
            "logConfiguration": {
                "logDriver": "awslogs",
          "options": {
            "awslogs-group": "${aws_cloudwatch_log_group.logs.name}",
            "awslogs-region": "${var.aws_region}",
            "awslogs-stream-prefix": "ecs"
          }
        }
        }
    ]
    DEFINITION
}

resource "aws_ecs_service" "backend-service" {
  name                 = local.ecs_service_name
  cluster              = aws_ecs_cluster.sample-node-app-cluster.id
  task_definition      = aws_ecs_task_definition.sample-node-app-task.arn
  desired_count        = 1
  launch_type          = "FARGATE"
  force_new_deployment = true

  network_configuration {
    security_groups = [
    aws_security_group.security_group_example_app.id]
    subnets = ["subnet-07e67829"]
    assign_public_ip = true
  }

  tags = merge(local.tags, {
    Name = local.ecs_service_name
  })
}