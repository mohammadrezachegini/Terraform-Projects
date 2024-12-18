resource "google_compute_region_health_check" "myapp1" {
  name = "${local.name}-myapp1"
  check_interval_sec = 5
  timeout_sec = 5
  healthy_threshold = 2
  unhealthy_threshold = 3
  http_health_check {
    request_path = "/index.html"
    port = 80
  }
}