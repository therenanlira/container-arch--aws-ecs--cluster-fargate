locals {
  ecs_resource_name = "ecs-cluster"
}

resource "aws_ecs_cluster" "ecs_cluster" {
  name = "${var.project_name}--${local.ecs_resource_name}"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_ecs_cluster_capacity_providers" "ecs_cluster_capacity_providers" {
  cluster_name = aws_ecs_cluster.ecs_cluster.name

  capacity_providers = [
    aws_ecs_capacity_provider.ecs_capacity_provider_ondemand.name,
    aws_ecs_capacity_provider.ecs_capacity_provider_spot.name
  ]

  default_capacity_provider_strategy {
    capacity_provider = aws_ecs_capacity_provider.ecs_capacity_provider_ondemand.name
    weight            = 100
    base              = 0
  }
}