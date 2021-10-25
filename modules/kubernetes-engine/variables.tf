variable "gke_name" {
  type     = string
  description = "number of gke nodes"
}

variable "original_node_pool" {
  type     = string
  description = "number of gke nodes"
}

variable "secondary_node_pool" {
  type     = string
  description = "number of gke nodes"
}

variable "gke_num_nodes" {
  default     = 2
  description = "number of gke nodes"
}

variable "region" {
  description = "region of subnetwork"
  type = string
}

variable "first_pod_subnet" {
  description = "region of subnetwork"
  type = string
}

variable "first_svc_subnet" {
  description = "region of subnetwork"
  type = string
}

variable "second_pod_subnet" {
  description = "region of subnetwork"
  type = string
}

variable "second_svc_subnet" {
  description = "region of subnetwork"
  type = string
}

variable "gke_secondary_num_nodes" {
  description = "region of subnetwork"
  type = number
}

variable "project_id" {
  description = "The ID of the project to create the bucket in."
  type        = string
}
