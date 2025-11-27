variable "image" {
  description = "Imagen de Nginx para el load balancer"
  type        = string
  default     = "nginx:alpine"
}

variable "container_name" {
  description = "Nombre del contenedor del load balancer"
  type        = string
}

variable "listen_port" {
  description = "Puerto del host donde escuchará el load balancer"
  type        = number
}

variable "network_name" {
  description = "Nombre de la red Docker donde viven el LB y los backends"
  type        = string
}

variable "backends" {
  description = "Lista de nombres de contenedor de las réplicas web"
  type        = list(string)
}

variable "backend_port" {
  description = "Puerto interno de las réplicas web (dentro del contenedor)"
  type        = number
  default     = 5000
}
