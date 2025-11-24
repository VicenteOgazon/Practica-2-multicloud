variable "image" {
  type = string
  description = "Imagen de Redis para la cache"
}

variable "container_name" {
  type = string
  description = "Nombre de la cache"
}

variable "cache_host_port" {
  type = string
  description = "Puerto del host para la cache"
}

variable "cache_container_port" {
  type = string
  description = "Puerto del contenedor para la cache"
}

variable "network_name" {
  type        = string
  description = "Nombre de la red Docker a la que se conecta la DB"
}