locals {
  lb_resource_name = "${substr(var.load_balancer_type, 0, 1)}lb"
}

resource "aws_security_group" "load_balancer_sg" {
  name        = "${var.project_name}--${local.lb_resource_name}--sg"
  description = "Security group for the load balancer"
  vpc_id      = data.aws_ssm_parameter.vpc_id.value

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name     = "${var.project_name}--${local.lb_resource_name}--sg"
    Resource = "load-balancer-sg"
  }
}

resource "aws_security_group_rule" "load_balancer_sg_ingress" {
  description       = "Allow HTTP inbound traffic"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = aws_security_group.load_balancer_sg.id
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_lb" "load_balancer" {
  name               = "${var.project_name}--${local.lb_resource_name}"
  internal           = var.load_balancer_internal
  load_balancer_type = var.load_balancer_type
  security_groups    = [aws_security_group.load_balancer_sg.id]

  subnets = [
    data.aws_ssm_parameter.public_subnet_1a.value,
    data.aws_ssm_parameter.public_subnet_1b.value,
    data.aws_ssm_parameter.public_subnet_1c.value
  ]

  enable_cross_zone_load_balancing = false
  enable_deletion_protection       = false

  tags = {
    Name     = "${var.project_name}--${local.lb_resource_name}"
    Resource = "load-balancer"
  }
}

resource "aws_lb_listener" "load_balancer_http_listener" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "LinuxTips - ECS Cluster"
      status_code  = "200"
    }
  }

  tags = {
    Name     = "${var.project_name}--${local.lb_resource_name}--http-listener"
    Resource = "load-balancer-listener"
  }
}
