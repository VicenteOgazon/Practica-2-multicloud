terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.6.2"
    }
  }
}


resource "docker_image" "web" {
  name = var.image
}

# Create a container
resource "docker_container" "web_container" {

  count = var.replicas
  image = docker_image.web.image_id
  name  = "${var.container_name}-${count.index}"

  #ports {
  #  internal = var.internal_port    
  #  external = var.external_port
  #}

  dynamic "mounts" {
    for_each = var.use_local_code && var.host_path != null && var.container_path != null ? [1] : []

    content {
      target = var.container_path
      source = var.host_path
      type   = "bind"
    }
  }

  env = [
    "INSTANCE_NAME=${var.container_name}-${count.index}",
    "APP_ENV=${var.app_env}",
    "FLASK_APP=__init__:create_app",
    "FLASK_RUN_HOST=0.0.0.0",
    "FLASK_DEBUG=${var.flask_debug}",
    "MYSQL_HOST=${var.db_container_name}",
    "MYSQL_ROOT_PASSWORD=${var.db_root_pass}",
    "MYSQL_DATABASE=${var.db_name}",
    "MYSQL_USER=${var.db_user}",
    "MYSQL_PASSWORD=${var.db_password}",
    "REDIS_HOST=${var.cache_container_name}"
  ]

  networks_advanced {
    name = var.network_name
  }
}