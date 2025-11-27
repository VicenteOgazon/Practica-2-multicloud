# Web
variable "app_image" {
  description = "Imagen Docker para la aplicación web"
  type        = string
}

variable "web_container_name" {
  description = "Nombre del contenedor web"
  type        = string
}

variable "web_external_port" {
  description = "Puerto en el host para exponer la web"
  type        = number
}

variable "web_internal_port" {
  description = "Puerto interno del contenedor web"
  type        = number
}

variable "environment" {
  description = "Nombre del entorno"
  type        = string
}

variable "flask_debug" {
  description = "Modo debug para que recargue automaticamente si se hacen cambios en dev"
  type = string
  default = "0"
}

variable "network_name" {
  description = "Nombre de la red Docker compartida por los servicios"
  type        = string
}

variable "web_host_path" {
    description = "Ruta en el host donde está la aplicación"
    type = string
    default = null
}

variable "web_container_path" {
    description = "Ruta en el contenedor donde se monta la aplicación"
    type = string
    default = null
}

# Base de datos
variable "db_image" {
  description = "Imagen Docker para la base de datos"
  type        = string
}

variable "db_container_name" {
  description = "Nombre del contenedor de base de datos"
  type        = string
}

variable "db_name" {
  description = "Nombre de la base de datos"
  type        = string
}

variable "db_user" {
  description = "Usuario de la base de datos"
  type        = string
}

variable "db_password" {
  description = "Password de la base de datos"
  type        = string
  sensitive   = true
}

variable "db_root_password" {
  description = "Password de root de la base de datos (si aplica, ej. MySQL)"
  type        = string
  sensitive   = true
}

variable "db_init" {
  description = "Ruta en el host para el script de inicialización de la base de datos"
  type        = string
}

variable "volume_name" {
  description = "Nombre del volumen Docker para persistencia de datos"
  type        = string
}

variable "cache_container_name" {
  type = string
  description = "Nombre del contenedor de la cache"
  default = " "
}

variable "use_local_code" {
  description = "Si true, monta el código desde el host (entorno de desarrollo)"
  type        = bool
  default     = false
}

variable "web_replicas" {
  description = "Número de réplicas del servicio web"
  type        = number
  default     = 1
}

variable "lb_image" {
  description = "Imagen Docker para la aplicación web"
  type        = string
}

variable "lb_container_name" {
  description = "Nombre del contenedor web"
  type        = string
}
variable "lb_listen_port" {
  description = "Puerto en el host donde el Load Balancer escucha"
  type        = number
}