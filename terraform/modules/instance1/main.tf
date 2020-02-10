resource "google_compute_instance" "instance1" {
  project      = "${var.project}"
  zone         = "${var.region}-a"
  name         = "instance1"
  machine_type = "${var.instance-type}"

  boot_disk {
    initialize_params {
      image = "centos-7"
    }
  }
  metadata = {
    ssh-keys = "${var.ssh_user}:${var.ssh_key}"
  }
  network_interface {
    subnetwork = "${var.subnetpub}"

    access_config {
      # Include this section to give the VM an external ip address
    }
  }
  network_interface {
    subnetwork = "${var.subnetpriv}"
  }
  # Apply the firewall rule to allow external IPs to access this instance
  tags = ["http-server", "allow-ssh"]
}
