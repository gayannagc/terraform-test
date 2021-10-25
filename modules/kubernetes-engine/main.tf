

# GKE cluster
resource "google_container_cluster" "primary" {
  name     = var.gke_name
  location = var.region
  default_max_pods_per_node = 8
  project = var.project_id
  
  
  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

#  network    = google_compute_network.vpc.name
#  subnetwork = google_compute_subnetwork.subnet.name
  network    = "pool-extension-test-vpc"
  subnetwork = "primary-subnet"

  ip_allocation_policy {
        cluster_secondary_range_name  = var.first_pod_subnet
        services_secondary_range_name =  var.first_svc_subnet
    }
}

# Separately Managed Node Pool
resource "google_container_node_pool" "primary_nodes" {
  name       = var.original_node_pool
  location   = var.region
  cluster    = google_container_cluster.primary.name
  node_count = var.gke_num_nodes
  project = var.project_id

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels = {
      env = var.project_id
    }

    # preemptible  = true
    machine_type = "n1-standard-1"
    tags         = ["gke-node", "${var.project_id}-gke"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }

#  network_config {
#
#    pod_range = var.second_pod_subnet
#  }
}

# Separately Managed Node Pool
resource "google_container_node_pool" "secondary_nodes" {
  provider = "google-beta"
  name       = var.secondary_node_pool
  location   = var.region
  cluster    = google_container_cluster.primary.name
  node_count = var.gke_secondary_num_nodes
  project = var.project_id
  max_pods_per_node = 64

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels = {
      env = var.project_id
    }

    # preemptible  = true
    machine_type = "n1-standard-1"
    tags         = ["gke-node", "${var.project_id}-gke"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }

    network_config {
      create_pod_range = false
      pod_range = var.second_pod_subnet
    }
}

