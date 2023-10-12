/*
output "vm_instances" {
  value       = google_compute_instance.vm_instance.*.network_interface
  description = "The vm instance config"
  sensitive   = false
}
*/

output "ips" {
  value       = data.google_compute_instance.vm_instances_data.*.network_interface.0.access_config.0.nat_ip
  description = "The instance ip"
}
