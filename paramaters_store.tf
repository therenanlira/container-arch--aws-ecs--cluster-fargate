resource "aws_ssm_parameter" "load_balancer_arn" {
  name  = "${var.project_name}--load-balancer-arn"
  type  = "String"
  value = aws_lb.load_balancer.arn

  tags = {
    Name     = "${var.project_name}--load-balancer-arn"
    Resource = "ssm-parameter"
  }
}

resource "aws_ssm_parameter" "load_balancer_http_listener_arn" {
  name  = "${var.project_name}--load-balancer-http-listener-arn"
  type  = "String"
  value = aws_lb_listener.load_balancer_http_listener.arn

  tags = {
    Name     = "${var.project_name}--load-balancer-http-listener-arn"
    Resource = "ssm-parameter"
  }
}
