#### GENERAL CONFIGURATIONS ####

project_name = "linuxtips-ecscluster"
region       = "us-east-1"

#### SSM VPC PARAMETERS ####

ssm_vpc_id           = "linuxtips-vpc-vpc-id"
ssm_public_subnet_1  = "linuxtips-vpc-public-subnet-1a"
ssm_public_subnet_2  = "linuxtips-vpc-public-subnet-1b"
ssm_public_subnet_3  = "linuxtips-vpc-public-subnet-1c"
ssm_private_subnet_1 = "linuxtips-vpc-private-subnet-1a"
ssm_private_subnet_2 = "linuxtips-vpc-private-subnet-1b"
ssm_private_subnet_3 = "linuxtips-vpc-private-subnet-1c"

#### BALANCER CONFIGURATION ####

load_balancer_internal = false
load_balancer_type     = "application"

#### ECS CLUSTER CONFIGURATION ####

cluster_cp                        = "FARGATE"
nodes_ami                         = "ami-09d3335e2eaf06692"
node_instance_type                = "t3a.micro"
node_volume_size                  = "30"
node_volume_type                  = "gp3"
cluster_ondemand_min_size         = 1
cluster_ondemand_max_size         = 3
cluster_ondemand_desired_capacity = 2
cluster_spot_min_size             = 1
cluster_spot_max_size             = 3
cluster_spot_desired_capacity     = 2
cluster_fargate_min_size          = 1
cluster_fargate_max_size          = 3
cluster_fargate_desired_capacity  = 2
cp_ondemand_min_scaling_step_size = 1
cp_ondemand_max_scaling_step_size = 5
cp_ondemand_target_capacity       = 80
cp_spot_min_scaling_step_size     = 1
cp_spot_max_scaling_step_size     = 5
cp_spot_target_capacity           = 80
cp_fargate_min_scaling_step_size  = 1
cp_fargate_max_scaling_step_size  = 5
cp_fargate_target_capacity        = 80
