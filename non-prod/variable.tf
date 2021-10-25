
variable "test_vpc_name" {
  description = "vpc name"
  type        = string
}

variable "test_project_id" {
  description = "The ID of the project to create the bucket in."
  type        = string
}

variable "test_region" {
  description = "The region of the bucket."
  type        = string
}

variable "test_primary_subnet_name" {
  description = "region of subnetwork"
  type = string
}

variable "test_first_pod_subnet" {
  description = "region of subnetwork"
  type = string
}

variable "test_first_svc_subnet" {
  description = "region of subnetwork"
  type = string
}

variable "test_second_pod_subnet" {
  description = "region of subnetwork"
  type = string
}

variable "test_second_svc_subnet" {
  description = "region of subnetwork"
  type = string
}

variable "test_gke_num_nodes" {
  type     = number
  description = "number of gke nodes"
}

variable "test_gke_name" {
  type     = string
  description = "number of gke nodes"
}

variable "test_original_node_pool" {
  type     = string
  description = "number of gke nodes"
}

variable "test_gke_secondary_num_nodes" {
  description = "region of subnetwork"
  type = number
}

variable "test_secondary_node_pool" {
  type     = string
  description = "number of gke nodes"
}

