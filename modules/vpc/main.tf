resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  project = var.project_id
  auto_create_subnetworks = "false"
}


resource "google_compute_subnetwork" "subnet" {
  name          = var.primary_subnet_name
  region        = var.region
  project = var.project_id
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.44.130.0/27"
  secondary_ip_range = [
    {
      range_name    =  var.first_pod_subnet
      ip_cidr_range = "10.44.130.128/25"
    },
    {
      range_name    =  var.first_svc_subnet
      ip_cidr_range = "10.44.130.64/26"
    },
    {
      range_name    =  var.second_pod_subnet
      ip_cidr_range = "10.44.120.0/22"
    },
    {
      range_name    =  var.second_svc_subnet
      ip_cidr_range = "10.44.140.0/23"
    }
  ]
}