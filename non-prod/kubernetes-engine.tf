module "vpc_for_node_pool_extension" {
    source = "../modules/vpc"

    vpc_name           = var.test_vpc_name
    region             = var.test_region
    project_id         = var.test_project_id
    primary_subnet_name = var.test_primary_subnet_name
    first_pod_subnet = var.test_first_pod_subnet
    first_svc_subnet = var.test_first_svc_subnet
    second_pod_subnet = var.test_second_pod_subnet
    second_svc_subnet = var.test_second_svc_subnet

}

module "gke_for_node_pool_extension" {
    source = "../modules/kubernetes-engine"

    gke_name             = var.test_gke_name
    region               = var.test_region
    project_id           = var.test_project_id
    gke_num_nodes        = var.test_gke_num_nodes
    first_pod_subnet     = var.test_first_pod_subnet
    first_svc_subnet     = var.test_first_svc_subnet
    original_node_pool   = var.test_original_node_pool
    second_pod_subnet    = var.test_second_pod_subnet
    second_svc_subnet    = var.test_second_svc_subnet
    gke_secondary_num_nodes = var.test_gke_secondary_num_nodes
    secondary_node_pool = var.test_secondary_node_pool

}