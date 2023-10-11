output "vm_instances" {
  value       = google_compute_instance.vm_instance
  description = "The vm instance config"
  sensitive   = true
}

output "ips" {
  value       = data.google_compute_address.my_address.*.address
  description = "The instance ip"
}
