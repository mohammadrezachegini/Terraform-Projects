# Resource: Regional Health Check
resource "google_compute_region_health_check" "myapp1" {
  name                = "${local.name}-myapp1"
  check_interval_sec  = 20
  timeout_sec         = 10
  healthy_threshold   = 3
  unhealthy_threshold = 3
  http_health_check {
    request_path = "/login"
    port         = 8080
  }
}