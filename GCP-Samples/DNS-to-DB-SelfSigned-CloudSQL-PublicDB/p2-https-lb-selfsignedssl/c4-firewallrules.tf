resource "google_compute_firewall" "fw_ssh" {
    name = "${local.name}-fwrule-allow-ssh22"
    allow {
        protocol = "tcp"
        ports = ["22"]
    }
    direction = "INGRESS"
    network = google_compute_network.myvpc.id
    priority = 1000
    source_ranges = ["0.0.0.0/0"]
    target_tags = ["ssh-tag"]
  
}


resource "google_compute_firewall" "fw_http" {
    name = "${local.name}-fwrule-allow-http80"
    allow {
        protocol = "tcp"
        ports = ["80","8080"]
    }
    direction = "INGRESS"
    network = google_compute_network.myvpc.id
    priority = 1000
    source_ranges = ["0.0.0.0/0"]
    target_tags = ["webserver-tag"]
  
}


resource "google_compute_firewall" "fw_health_checks" {
    name = "fwrule-allow-health-checks"
    network = google_compute_network.myvpc.id
    allow {
        protocol = "tcp"
        ports = ["80","8080"]
    }

    source_ranges = [
        "35.191.0.0/16",
        "130.211.0.0/22"
    ]

    target_tags = [ "allow-health-checks" ]

  
}