variable "project_id" {
  description = "The ID of the project to create the bucket in."
  type        = string
}

variable "vpc_name" {
  description = "vpc name"
  type        = string
}

variable "region" {
  description = "region of subnetwork"
  type = string
}

variable "primary_subnet_name" {
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