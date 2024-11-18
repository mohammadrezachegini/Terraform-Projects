resource "google_compute_region_autoscaler" "myapp1" {
    name = "${local.name}-myapp1-autoscalar"
    target = google_compute_region_instance_group_manager.myapp1.id
    autoscaling_policy {
        min_replicas = 2
        max_replicas = 6
        cooldown_period = 60
        cpu_utilization {
            target = 0.8
        }
    }
  
}