output ips { 
 value = google_compute_network.vpc_network.*.name
}
