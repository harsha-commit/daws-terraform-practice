/*
  Steps:
    open -a Docker (Open Docker Desktop -> Starts Docker Engine)
    Write terraform configuration
    terraform init (Downloads Providers)
    terraform plan
    terraform apply
    docker ps
    terraform destroy
*/

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Pulls the image
resource "docker_image" "nginx-image" {
  name = "nginx:latest"
  keep_locally = false
}

# Create a container
resource "docker_container" "nginx-container" {
  image = docker_image.nginx-image.image_id
  name  = "nginx-server"

  ports{
    internal = 80
    external = 8080
  }
}