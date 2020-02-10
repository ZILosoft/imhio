output "public_gateway_address" {
  value       = "${google_compute_subnetwork.public_subnet.gateway_address}"
  description = "The IP address of the gateway."
}

output "public_subnet_name" {
  value       = "${google_compute_subnetwork.public_subnet.name}"
  description = "public name"
}


output "private_subnet_name" {
  value       = "${google_compute_subnetwork.private_subnet.name}"
  description = "private name"
}

output "public_network_name" {
  value       = "${google_compute_network.pub.name}"
  description = "public network name"
}

output "private_network_name" {
  value       = "${google_compute_network.priv.name}"
  description = "private network name"
}

