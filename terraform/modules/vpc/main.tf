resource "google_compute_network" "priv" {
  name          =  "${var.network_name}-priv"
  auto_create_subnetworks = "false"
  routing_mode            = "GLOBAL"
  project  = "${var.project}"
}

resource "google_compute_network" "pub" {
  name          =  "${var.network_name}-pub"
  auto_create_subnetworks = "false"
  routing_mode            = "GLOBAL"
  project  = "${var.project}"
}

resource "google_compute_subnetwork" "public_subnet" {
  name          = "${var.network_name}-subnet-pub"
  ip_cidr_range = "${var.subnet_ip_pub}"
  region        = "${var.region}"
  network = "${var.network_name}-pub"
  depends_on = [google_compute_network.pub]
}
resource "google_compute_subnetwork" "private_subnet" {
  name          = "${var.network_name}-subnet-priv"
  ip_cidr_range = "${var.subnet_ip_priv}"
  region        = "${var.region}"
  network = "${var.network_name}-priv"
  depends_on = [google_compute_network.priv]
}
