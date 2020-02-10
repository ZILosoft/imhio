output "instance_name" {
  value = "${google_compute_instance.instance1.name}"
}

output "external_ip" {
  value = "${google_compute_instance.instance1.network_interface.0.access_config.0.nat_ip}"
}

output "internal_ip" {
  value = "${google_compute_instance.instance1.network_interface.1.network_ip}"
}