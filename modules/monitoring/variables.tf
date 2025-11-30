variable "network_name" {
  description = "Nombre de la red Docker donde están los servicios"
  type        = string
}

variable "prometheus_image" {
  type    = string
  default = "prom/prometheus:latest"
}

variable "prometheus_container_name" {
  type = string
}

variable "prometheus_scrape_targets" {
  description = "Lista de targets host:puerto que Prometheus va a scrapear (dev_web-0:5000, etc.)"
  type        = list(string)
}

variable "prometheus_external_port" {
  type    = number
  default = 9090
}

variable "prometheus_internal_port" {
  type    = number
  default = 9090
}

variable "grafana_image" {
  type    = string
}

variable "grafana_container_name" {
  type    = string
}

variable "grafana_external_port" {
  type    = number
  default = 3000
}

variable "grafana_internal_port" {
  type    = number
  default = 3000
}

variable "grafana_admin_user" {
  type    = string
}

variable "grafana_admin_password" {
  type    = string
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

# Loki
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

# Promtail
variable "promtail_image" {
  type    = string
  default = "grafana/promtail:2.9.0"
}

variable "promtail_container_name" {
  type = string
}
