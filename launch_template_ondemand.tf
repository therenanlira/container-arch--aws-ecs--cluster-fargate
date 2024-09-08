locals {
  lt_ondemand_resource_name = "launch-template--ondemand"
}

resource "aws_launch_template" "launch_template_ondemand" {
  name_prefix   = "${var.project_name}--${local.lt_ondemand_resource_name}"
  image_id      = var.nodes_ami
  instance_type = var.node_instance_type

  vpc_security_group_ids = [aws_security_group.load_balancer_sg.id]

  iam_instance_profile {
    name = aws_iam_instance_profile.ecs_instance_profile.name
  }

  update_default_version = true

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size = var.node_volume_size
      volume_type = var.node_volume_type
    }
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name     = "${var.project_name}--node"
      Resource = "node"
    }
  }

  user_data = base64encode(templatefile("${path.module}/templates/user_data.tpl", {
    cluster_name = var.project_name
  }))
}
