locals {
#   vpc_name = "sample-node-app-vpc-${var.env}"
#   sg_name = "sample-node-app-public-sg-${var.env}"
#   target_group_name = "sample-node-app-ecs-target-group-${var.env}"
  ecs_cluster_name = "sample-node-app-service-cluster-${var.env}"
  ecs_service_name = "sample-node-app-service-${var.env}"
  cloudwatch_group = "sample-node-app-${var.env}"

  tags = {
    env = var.env,
    Application = "sample-node-app-service"
  }
}
