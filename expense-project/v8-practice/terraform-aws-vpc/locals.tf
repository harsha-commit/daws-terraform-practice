locals {
  resource_prefix    = "${var.project_name}-${var.environment}"
  availability_zones = data.aws_availability_zones.available_zones
}