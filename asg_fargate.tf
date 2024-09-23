locals {
  asg_fargate_resource_name = "ecs-asg--fargate"
}

resource "aws_autoscaling_group" "ecs_asg_fargate" {
  count       = var.cluster_cp == "FARGATE" ? 1 : 0
  name_prefix = "${var.project_name}--${local.asg_fargate_resource_name}"

  vpc_zone_identifier = [
    data.aws_ssm_parameter.private_subnet_1a.value,
    data.aws_ssm_parameter.private_subnet_1b.value,
    data.aws_ssm_parameter.private_subnet_1c.value
  ]

  desired_capacity = var.cluster_fargate_desired_capacity
  min_size         = var.cluster_fargate_min_size
  max_size         = var.cluster_fargate_max_size

  launch_template {
    id      = aws_launch_template.launch_template_fargate.id
    version = aws_launch_template.launch_template_fargate.latest_version
  }

  tag {
    key                 = "Name"
    value               = "${var.project_name}--${local.asg_fargate_resource_name}"
    propagate_at_launch = true
  }

  tag {
    key                 = "Resource"
    value               = local.asg_fargate_resource_name
    propagate_at_launch = true
  }

  tag {
    key                 = "AmazonECSManaged"
    value               = true
    propagate_at_launch = true
  }

  lifecycle {
    ignore_changes = [
      desired_capacity
    ]
  }
}

resource "aws_ecs_capacity_provider" "ecs_capacity_provider_fargate" {
  count = var.cluster_cp == "FARGATE" ? 1 : 0
  name  = "${var.project_name}--ecs-cp--fargate"

  auto_scaling_group_provider {
    auto_scaling_group_arn = aws_autoscaling_group.ecs_asg_fargate[0].arn

    managed_scaling {
      status                    = "ENABLED"
      minimum_scaling_step_size = var.cp_fargate_min_scaling_step_size
      maximum_scaling_step_size = var.cp_fargate_max_scaling_step_size
      target_capacity           = var.cp_fargate_target_capacity
    }
  }

  tags = {
    Name     = "${var.project_name}--ecs-cp--fargate"
    Resource = "ecs-cp"
  }
}
