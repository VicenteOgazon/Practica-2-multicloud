terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.6.2"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

module "network" {
  source = "../modules/network"

  network_name = var.network_name
}

module "web" {
  source = "../modules/web"

  replicas = var.web_replicas
  image = var.app_image
  container_name = var.web_container_name
  internal_port = var.web_internal_port
  app_env = var.environment
  db_container_name = var.db_container_name
  db_root_pass = var.db_root_password
  db_name = var.db_name
  db_user = var.db_user
  db_password = var.db_password
  cache_container_name = var.cache_container_name
  network_name = module.network.network_name
}

module "mysql" {
  source = "../modules/db"

  image = var.db_image
  container_name = var.db_container_name
  db_name = var.db_name
  db_user = var.db_user
  db_password = var.db_password
  db_root_password = var.db_root_password
  host_path = var.db_init
  volume_name = var.volume_name
  network_name = module.network.network_name
}

module "lb" {
  source = "../modules/lb"

  image          = var.lb_image
  container_name = var.lb_container_name
  listen_port    = var.lb_listen_port                       # puerto host dev
  network_name   = module.network.network_name
  backends      = module.web.container_names    # ["web-dev-0", "web-dev-1", ...]
  backend_port  = var.web_internal_port        # puerto interno de las webs
}