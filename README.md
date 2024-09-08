# container-arch--aws-ecs-cluster
<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.66.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_group.ecs_asg_ondemand](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_autoscaling_group.ecs_asg_spot](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_ecs_capacity_provider.ecs_capacity_provider_ondemand](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_capacity_provider) | resource |
| [aws_ecs_capacity_provider.ecs_capacity_provider_spot](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_capacity_provider) | resource |
| [aws_ecs_cluster.ecs_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) | resource |
| [aws_ecs_cluster_capacity_providers.ecs_cluster_capacity_providers](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster_capacity_providers) | resource |
| [aws_iam_instance_profile.ecs_instance_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.ecs_instance_profile_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.ecs_instance_profile_policy_ec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ecs_instance_profile_policy_ssm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_launch_template.launch_template_ondemand](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |
| [aws_launch_template.launch_template_spot](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |
| [aws_lb.load_balancer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.load_balancer_http_listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_security_group.load_balancer_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.load_balancer_sg_ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_ssm_parameter.load_balancer_arn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.load_balancer_http_listener_arn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.private_subnet_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.private_subnet_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.private_subnet_1c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.public_subnet_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.public_subnet_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.public_subnet_1c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.vpc_id](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_ondemand_desired_capacity"></a> [cluster\_ondemand\_desired\_capacity](#input\_cluster\_ondemand\_desired\_capacity) | The desired capacity for the ECS cluster | `number` | n/a | yes |
| <a name="input_cluster_ondemand_max_size"></a> [cluster\_ondemand\_max\_size](#input\_cluster\_ondemand\_max\_size) | The maximum size for the ECS cluster | `number` | n/a | yes |
| <a name="input_cluster_ondemand_min_size"></a> [cluster\_ondemand\_min\_size](#input\_cluster\_ondemand\_min\_size) | The minimum size for the ECS cluster | `number` | n/a | yes |
| <a name="input_cluster_spot_desired_capacity"></a> [cluster\_spot\_desired\_capacity](#input\_cluster\_spot\_desired\_capacity) | The desired capacity for the ECS cluster | `number` | n/a | yes |
| <a name="input_cluster_spot_max_size"></a> [cluster\_spot\_max\_size](#input\_cluster\_spot\_max\_size) | The maximum size for the ECS cluster | `number` | n/a | yes |
| <a name="input_cluster_spot_min_size"></a> [cluster\_spot\_min\_size](#input\_cluster\_spot\_min\_size) | The minimum size for the ECS cluster | `number` | n/a | yes |
| <a name="input_cp_ondemand_max_scaling_step_size"></a> [cp\_ondemand\_max\_scaling\_step\_size](#input\_cp\_ondemand\_max\_scaling\_step\_size) | The maximum scaling step size for the ECS capacity provider | `number` | n/a | yes |
| <a name="input_cp_ondemand_min_scaling_step_size"></a> [cp\_ondemand\_min\_scaling\_step\_size](#input\_cp\_ondemand\_min\_scaling\_step\_size) | The minimum scaling step size for the ECS capacity provider | `number` | n/a | yes |
| <a name="input_cp_ondemand_target_capacity"></a> [cp\_ondemand\_target\_capacity](#input\_cp\_ondemand\_target\_capacity) | The target capacity for the ECS capacity provider | `number` | n/a | yes |
| <a name="input_cp_spot_max_scaling_step_size"></a> [cp\_spot\_max\_scaling\_step\_size](#input\_cp\_spot\_max\_scaling\_step\_size) | The maximum scaling step size for the ECS capacity provider | `number` | n/a | yes |
| <a name="input_cp_spot_min_scaling_step_size"></a> [cp\_spot\_min\_scaling\_step\_size](#input\_cp\_spot\_min\_scaling\_step\_size) | The minimum scaling step size for the ECS capacity provider | `number` | n/a | yes |
| <a name="input_cp_spot_target_capacity"></a> [cp\_spot\_target\_capacity](#input\_cp\_spot\_target\_capacity) | The target capacity for the ECS capacity provider | `number` | n/a | yes |
| <a name="input_load_balancer_internal"></a> [load\_balancer\_internal](#input\_load\_balancer\_internal) | If the load balancer is internal or not | `bool` | n/a | yes |
| <a name="input_load_balancer_type"></a> [load\_balancer\_type](#input\_load\_balancer\_type) | The type of the load balancer | `string` | n/a | yes |
| <a name="input_node_instance_type"></a> [node\_instance\_type](#input\_node\_instance\_type) | The instance type for the ECS cluster nodes | `string` | n/a | yes |
| <a name="input_node_volume_size"></a> [node\_volume\_size](#input\_node\_volume\_size) | The volume size for the ECS cluster nodes | `string` | n/a | yes |
| <a name="input_node_volume_type"></a> [node\_volume\_type](#input\_node\_volume\_type) | The volume type for the ECS cluster nodes | `string` | n/a | yes |
| <a name="input_nodes_ami"></a> [nodes\_ami](#input\_nodes\_ami) | The AMI ID for the ECS cluster nodes | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The name of the project | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region where the resources will be created | `string` | n/a | yes |
| <a name="input_ssm_private_subnet_1"></a> [ssm\_private\_subnet\_1](#input\_ssm\_private\_subnet\_1) | The SSM parameter name for the private subnet 1 | `string` | n/a | yes |
| <a name="input_ssm_private_subnet_2"></a> [ssm\_private\_subnet\_2](#input\_ssm\_private\_subnet\_2) | The SSM parameter name for the private subnet 2 | `string` | n/a | yes |
| <a name="input_ssm_private_subnet_3"></a> [ssm\_private\_subnet\_3](#input\_ssm\_private\_subnet\_3) | The SSM parameter name for the private subnet 3 | `string` | n/a | yes |
| <a name="input_ssm_public_subnet_1"></a> [ssm\_public\_subnet\_1](#input\_ssm\_public\_subnet\_1) | The SSM parameter name for the public subnet 1 | `string` | n/a | yes |
| <a name="input_ssm_public_subnet_2"></a> [ssm\_public\_subnet\_2](#input\_ssm\_public\_subnet\_2) | The SSM parameter name for the public subnet 2 | `string` | n/a | yes |
| <a name="input_ssm_public_subnet_3"></a> [ssm\_public\_subnet\_3](#input\_ssm\_public\_subnet\_3) | The SSM parameter name for the public subnet 3 | `string` | n/a | yes |
| <a name="input_ssm_vpc_id"></a> [ssm\_vpc\_id](#input\_ssm\_vpc\_id) | The SSM parameter name for the VPC ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_load_balancer_dns"></a> [load\_balancer\_dns](#output\_load\_balancer\_dns) | n/a |
| <a name="output_ssm_load_balancer_arn"></a> [ssm\_load\_balancer\_arn](#output\_ssm\_load\_balancer\_arn) | n/a |
| <a name="output_ssm_load_balancer_http_listener_arn"></a> [ssm\_load\_balancer\_http\_listener\_arn](#output\_ssm\_load\_balancer\_http\_listener\_arn) | n/a |
<!-- END_TF_DOCS -->