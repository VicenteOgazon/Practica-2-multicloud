terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.6.2"
    }
  }
}

resource "docker_image" "cache" {
  name = var.image
}

resource "docker_container" "cache_container" {
  image = docker_image.cache.image_id
  name  = var.container_name

  env = [
    "REDIS_HOST=${var.cache_host_port}",
    "REDIS_PORT=${var.cache_container_port}"
  ]

  networks_advanced {
    name = var.network_name
  }
}