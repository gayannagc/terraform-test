#module "vpc_for_node_pool_extension" {
#    source = "../modules/vpc"
#
#    vpc_name           = var.test_vpc_name
#    region             = var.test_region
#    project_id         = var.test_project_id
#    primary_subnet_name = var.test_primary_subnet_name
#    first_pod_subnet = var.test_first_pod_subnet
#    first_svc_subnet = var.test_first_svc_subnet
#    second_pod_subnet = var.test_second_pod_subnet
#    second_svc_subnet = var.test_second_svc_subnet
#
#}