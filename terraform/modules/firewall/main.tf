resource "google_compute_firewall" "allow-http" {
  name    = "${var.subnetpub}-allow-http"
  network = "${var.subnetpub}"
  project = "${var.project}"

  allow {
    protocol = "tcp"
    ports    = ["8084"]
  }

  target_tags   = ["http-server"]
  source_ranges = ["0.0.0.0/0"]
}


resource "google_compute_firewall" "allow-ssh" {
  name    = "${var.subnetpub}-allow-ssh"
  network = "${var.subnetpub}"
  project = "${var.project}"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  target_tags   = ["allow-ssh"]
  source_ranges = ["${var.allowedip}"]
}


resource "google_compute_firewall" "allow" {
  name    = "${var.subnetpriv}-allow"
  network = "${var.subnetpriv}"
  project = "${var.project}"

  allow {
    protocol = "all"
  }

}