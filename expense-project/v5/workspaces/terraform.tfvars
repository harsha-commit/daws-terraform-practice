ec2_instance_names_map = {
  "dev" = {
    db-dev       = "t2.small"
    backend-dev  = "t2.micro"
    frontend-dev = "t2.micro"
  }
  "prod" = {
    db-prod       = "t2.medium"
    backend-prod  = "t2.large"
    frontend-prod = "t2.large"
  }
}