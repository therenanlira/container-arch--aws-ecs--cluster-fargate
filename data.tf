data "aws_ssm_parameter" "vpc_id" {
  name = var.ssm_vpc_id
}

data "aws_ssm_parameter" "public_subnet_1a" {
  name = var.ssm_public_subnet_1
}

data "aws_ssm_parameter" "public_subnet_1b" {
  name = var.ssm_public_subnet_2
}

data "aws_ssm_parameter" "public_subnet_1c" {
  name = var.ssm_public_subnet_3
}

data "aws_ssm_parameter" "private_subnet_1a" {
  name = var.ssm_private_subnet_1
}

data "aws_ssm_parameter" "private_subnet_1b" {
  name = var.ssm_private_subnet_2
}

data "aws_ssm_parameter" "private_subnet_1c" {
  name = var.ssm_private_subnet_3
}
