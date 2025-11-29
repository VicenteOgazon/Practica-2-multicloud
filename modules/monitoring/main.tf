terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.6.2"
    }
    local = {
      source  = "hashicorp/local" # Necesario para gestionar recursos locales
      version = "~> 2.4"
    }
  }
}

locals {
  prometheus_config = templatefile("${path.module}/prometheus.yml.tpl", {
    scrape_targets = var.prometheus_scrape_targets
  })
}

# Fichero de configuración de Prometheus
resource "local_file" "prometheus_config" {
  content  = local.prometheus_config
  filename = "/home/vicente/Escritorio/Grado Ingenieria/4 año/1 Semestre/Redes avanzadas/Practica2/modules/monitoring/generated-prometheus.yml"
}

# Volúmenes para datos
resource "docker_volume" "prometheus_data" {
  name = "prometheus_data"
}

resource "docker_volume" "grafana_data" {
  name = "grafana_data"
}

# Contenedor Prometheus
resource "docker_container" "prometheus" {
  name  = var.prometheus_container_name
  image = var.prometheus_image

  networks_advanced {
    name = var.network_name
  }

  ports {
    internal = var.prometheus_internal_port
    external = var.prometheus_external_port
  }

  volumes {
    host_path      = local_file.prometheus_config.filename
    container_path = "/etc/prometheus/prometheus.yml"
    read_only      = true
  }

  volumes {
    volume_name    = docker_volume.prometheus_data.name
    container_path = "/prometheus"
  }
}

# Contenedor Grafana
resource "docker_container" "grafana" {
  name  = "grafana"
  image = var.grafana_image

  networks_advanced {
    name = var.network_name
  }

  ports {
    internal = var.grafana_internal_port
    external = var.grafana_external_port
  }

  volumes {
    volume_name    = docker_volume.grafana_data.name
    container_path = "/var/lib/grafana"
  }

  env = [
    "GF_SECURITY_ADMIN_USER=${var.grafana_admin_user}",
    "GF_SECURITY_ADMIN_PASSWORD=${var.grafana_admin_password}",
    "GF_USERS_ALLOW_SIGN_UP=false",
  ]
}