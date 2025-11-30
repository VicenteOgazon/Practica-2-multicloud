# Web
variable "app_image" {
  description = "Imagen Docker para la aplicación web"
  type        = string
}

variable "web_container_name" {
  description = "Nombre del contenedor web"
  type        = string
}

variable "web_internal_port" {
  description = "Puerto interno del contenedor web"
  type        = number
}

variable "environment" {
  description = "Nombre del entorno"
  type        = string
}

variable "network_name" {
  description = "Nombre de la red Docker compartida por los servicios"
  type        = string
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

variable "prometheus_image" {
  description = "Imagen Docker para Prometheus"
  type        = string
}

variable "prometheus_container_name" {
  description = "Nombre del container prometheus"
}

variable "prometheus_internal_port" {
  description = "Puerto interno del contenedor Prometheus"
  type        = number
}

variable "prometheus_external_port" {
  description = "Puerto en el host para exponer Prometheus"
  type        = number
} 

variable "grafana_image" {
  description = "Imagen Docker para Grafana"
  type        = string
}

variable "grafana_container_name" {
  description = "Nombre del contenedor Grafana"
  type        = string
}

variable "grafana_internal_port" {
  description = "Puerto interno del contenedor Grafana"
  type        = number
}

variable "grafana_external_port" {
  description = "Puerto en el host para exponer Grafana"
  type        = number
}

variable "grafana_admin_password" {
  description = "Contraseña del usuario admin de Grafana"
  type        = string
  sensitive   = true
}

variable "grafana_admin_user" {
  description = "Usuario admin de Grafana"
  type        = string
}

variable "cadvisor_container_name" {
  description = "Nombre del cotnenedor cAdvisor"
  type = string
}

variable "cadvisor_image" {
  description = "Imagen de cAdvisor"
  type = string
}

variable "cadvisor_internal_port" {
  description = "Puerto interno del contendor cAdvisor"
  type = number
}

variable "cadvisor_external_port" {
  description = "Puerto interno del contendor cAdvisor"
  type = number
}

variable "loki_image" {
  type    = string
  default = "grafana/loki:2.9.0"
}

variable "loki_container_name" {
  type = string
}

variable "loki_internal_port" {
  type    = number
  default = 3100
}

variable "loki_external_port" {
  type = number
}

variable "promtail_image" {
  type    = string
}

variable "promtail_container_name" {
  type = string
}

variable "minio_image" {
  type    = string
}

variable "minio_container_name" {
  type = string
}

variable "minio_access_key" {
  type = string
}

variable "minio_secret_key" {
  type = string
}

variable "minio_api_internal_port" {
  type    = number
  default = 9000
}

variable "minio_api_external_port" {
  type = number
}

variable "minio_console_internal_port" {
  type    = number
  default = 9001
}

variable "minio_console_external_port" {
  type = number
}