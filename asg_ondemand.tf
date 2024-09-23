locals {
  asg_ondemand_resource_name = "ecs-asg--ondemand"
}

resource "aws_autoscaling_group" "ecs_asg_ondemand" {
  count       = var.cluster_cp == "EC2" ? 1 : 0
  name_prefix = "${var.project_name}--${local.asg_ondemand_resource_name}"

  vpc_zone_identifier = [
    data.aws_ssm_parameter.private_subnet_1a.value,
    data.aws_ssm_parameter.private_subnet_1b.value,
    data.aws_ssm_parameter.private_subnet_1c.value
  ]

  desired_capacity = var.cluster_ondemand_desired_capacity
  min_size         = var.cluster_ondemand_min_size
  max_size         = var.cluster_ondemand_max_size

  launch_template {
    id      = aws_launch_template.launch_template_ondemand.id
    version = aws_launch_template.launch_template_ondemand.latest_version
  }

  tag {
    key                 = "Name"
    value               = "${var.project_name}--${local.asg_ondemand_resource_name}"
    propagate_at_launch = true
  }

  tag {
    key                 = "Resource"
    value               = local.asg_ondemand_resource_name
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

resource "aws_ecs_capacity_provider" "ecs_capacity_provider_ondemand" {
  count = var.cluster_cp == "EC2" ? 1 : 0
  name  = "${var.project_name}--ecs-cp--ondemand"

  auto_scaling_group_provider {
    auto_scaling_group_arn = aws_autoscaling_group.ecs_asg_ondemand[0].arn

    managed_scaling {
      status                    = "ENABLED"
      minimum_scaling_step_size = var.cp_ondemand_min_scaling_step_size
      maximum_scaling_step_size = var.cp_ondemand_max_scaling_step_size
      target_capacity           = var.cp_ondemand_target_capacity
    }
  }

  tags = {
    Name     = "${var.project_name}--ecs-cp--ondemand"
    Resource = "ecs-cp"
  }
}
