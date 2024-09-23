#### GENERAL CONFIGURATION ####

variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "region" {
  description = "The region where the resources will be created"
  type        = string
}

#### SSM VPC PARAMETERS ####

variable "ssm_vpc_id" {
  description = "The SSM parameter name for the VPC ID"
  type        = string
}

variable "ssm_public_subnet_1" {
  description = "The SSM parameter name for the public subnet 1"
  type        = string
}

variable "ssm_public_subnet_2" {
  description = "The SSM parameter name for the public subnet 2"
  type        = string
}

variable "ssm_public_subnet_3" {
  description = "The SSM parameter name for the public subnet 3"
  type        = string
}

variable "ssm_private_subnet_1" {
  description = "The SSM parameter name for the private subnet 1"
  type        = string
}

variable "ssm_private_subnet_2" {
  description = "The SSM parameter name for the private subnet 2"
  type        = string
}

variable "ssm_private_subnet_3" {
  description = "The SSM parameter name for the private subnet 3"
  type        = string
}

#### BALANCER CONFIGURATION ####

variable "load_balancer_internal" {
  description = "If the load balancer is internal or not"
  type        = bool
}

variable "load_balancer_type" {
  description = "The type of the load balancer"
  type        = string
}

#### ECS CLUSTER CONFIGURATION ####

variable "nodes_ami" {
  description = "The AMI ID for the ECS cluster nodes"
  type        = string
}

variable "node_instance_type" {
  description = "The instance type for the ECS cluster nodes"
  type        = string
}

variable "node_volume_size" {
  description = "The volume size for the ECS cluster nodes"
  type        = string
}

variable "node_volume_type" {
  description = "The volume type for the ECS cluster nodes"
  type        = string
}

variable "cluster_cp" {
  description = "The capacity provider for the ECS cluster"
  type        = string
}

variable "cluster_ondemand_min_size" {
  description = "The minimum size for the ECS cluster"
  type        = number
}

variable "cluster_ondemand_max_size" {
  description = "The maximum size for the ECS cluster"
  type        = number
}

variable "cluster_ondemand_desired_capacity" {
  description = "The desired capacity for the ECS cluster"
  type        = number
}

variable "cluster_spot_min_size" {
  description = "The minimum size for the ECS cluster"
  type        = number
}

variable "cluster_spot_max_size" {
  description = "The maximum size for the ECS cluster"
  type        = number
}

variable "cluster_spot_desired_capacity" {
  description = "The desired capacity for the ECS cluster"
  type        = number
}

variable "cluster_fargate_min_size" {
  description = "The minimum size for the ECS cluster"
  type        = number
}

variable "cluster_fargate_max_size" {
  description = "The maximum size for the ECS cluster"
  type        = number
}

variable "cluster_fargate_desired_capacity" {
  description = "The desired capacity for the ECS cluster"
  type        = number
}


variable "cp_ondemand_min_scaling_step_size" {
  description = "The minimum scaling step size for the ECS capacity provider"
  type        = number
}

variable "cp_ondemand_max_scaling_step_size" {
  description = "The maximum scaling step size for the ECS capacity provider"
  type        = number
}

variable "cp_ondemand_target_capacity" {
  description = "The target capacity for the ECS capacity provider"
  type        = number
}

variable "cp_spot_min_scaling_step_size" {
  description = "The minimum scaling step size for the ECS capacity provider"
  type        = number
}

variable "cp_spot_max_scaling_step_size" {
  description = "The maximum scaling step size for the ECS capacity provider"
  type        = number
}

variable "cp_spot_target_capacity" {
  description = "The target capacity for the ECS capacity provider"
  type        = number
}

variable "cp_fargate_min_scaling_step_size" {
  description = "The minimum scaling step size for the ECS capacity provider"
  type        = number
}

variable "cp_fargate_max_scaling_step_size" {
  description = "The maximum scaling step size for the ECS capacity provider"
  type        = number
}

variable "cp_fargate_target_capacity" {
  description = "The target capacity for the ECS capacity provider"
  type        = number
}

variable "capacity_providers" {
  description = "The capacity provider for the ECS cluster"
  type        = list(any)
  default = [
    "FARGATE",
    "FARGATE_SPOT"
  ]
}