#### LOAD BALANCER OUTPUTS ####

output "load_balancer_dns" {
  value = aws_lb.load_balancer.dns_name
}

#### SSM PARAMETERS OUTPUTS ####

output "ssm_load_balancer_arn" {
  value = aws_ssm_parameter.load_balancer_arn.id
}

output "ssm_load_balancer_http_listener_arn" {
  value = aws_ssm_parameter.load_balancer_http_listener_arn.id
}
