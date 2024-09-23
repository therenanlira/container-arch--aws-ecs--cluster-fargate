locals {
  ecs_resource_name = "ecs-cluster"

  capacity_provider = var.cluster_cp == "FARGATE" ? var.capacity_providers : (var.cluster_cp == "EC2" ? [aws_ecs_capacity_provider.ecs_capacity_provider_ondemand[0].name] : (var.cluster_cp == "SPOT" ? [aws_ecs_capacity_provider.ecs_capacity_provider_spot[0].name] : null))
}

resource "aws_ecs_cluster" "ecs_cluster" {
  name = var.project_name

  setting {
    name  = "containerInsights"
    value = "enabled"
  }

  tags = {
    Name     = "${var.project_name}"
    Resource = "ecs-cluster"
  }
}

resource "aws_ecs_cluster_capacity_providers" "ecs_cluster_capacity_providers" {
  cluster_name = aws_ecs_cluster.ecs_cluster.name

  capacity_providers = local.capacity_provider

  default_capacity_provider_strategy {
    capacity_provider = var.cluster_cp == "FARGATE" ? "FARGATE" : tostring(local.capacity_provider)
    weight            = 100
    base              = var.cluster_cp == "FARGATE" ? 1 : 0
  }
}
