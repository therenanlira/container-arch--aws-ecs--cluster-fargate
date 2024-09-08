locals {
  iam_resource_name = "ecs-instance-profile"
}

resource "aws_iam_role" "ecs_instance_profile_role" {
  name = "${var.project_name}--${local.iam_resource_name}--role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_instance_profile_policy_ec2" {
  role       = aws_iam_role.ecs_instance_profile_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_role_policy_attachment" "ecs_instance_profile_policy_ssm" {
  role       = aws_iam_role.ecs_instance_profile_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}

resource "aws_iam_instance_profile" "ecs_instance_profile" {
  name = "${var.project_name}--${local.iam_resource_name}"
  role = aws_iam_role.ecs_instance_profile_role.name
}
