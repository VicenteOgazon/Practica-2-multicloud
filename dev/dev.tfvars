#variables de la aplicacion web
app_image = "app:dev"
web_container_name = "dev_web"
web_internal_port = 5000
environment = "development"
web_replicas = 2

#variables de la base de datos
db_image = "mysql:8.0"
db_init = "/home/vicente/Escritorio/Grado Ingenieria/4 año/1 Semestre/Redes avanzadas/Practica2/modules/db/init_dev/init.sql"
volume_name = "data_dev"
db_container_name = "dev_db"
db_root_password = "flaskrootdev"
db_name = "registro_usuarios_dev"
db_user = "flaskuserdev"
db_password = "flaskpassdev"

network_name = "dev_network"

#variables del Load Balancer
lb_image = "nginx:alpine"
lb_container_name = "dev_lb"
lb_listen_port = 6060

#variables de Prometheus
prometheus_container_name = "dev_prometheus"
prometheus_image = "ubuntu/prometheus:3-24.04_stable"
prometheus_internal_port = 9090
prometheus_external_port = 9090

#variables de Grafana
grafana_image = "grafana/grafana:latest"
grafana_container_name = "dev_grafana"
grafana_internal_port = 3000
grafana_external_port = 3000
grafana_admin_user = "admin"
grafana_admin_password = "admindev"

#variables de cAdvisor
cadvisor_container_name = "dev_cadvisor"
cadvisor_image = "gcr.io/cadvisor/cadvisor:latest"
cadvisor_internal_port = 8080
cadvisor_external_port = 8080

#variables de Loki
loki_container_name = "dev_loki"
loki_image = "grafana/loki:2.9.0"
loki_internal_port = 3100
loki_external_port = 3100

#variables de Promtail
promtail_container_name = "dev_promtail"
promtail_image          = "grafana/promtail:2.9.0"

#variables de MinIO
minio_image = "minio/minio:RELEASE.2024-04-18T19-09-19Z"
minio_container_name = "dev_minio"
minio_access_key = "devminio"
minio_secret_key = "miniodev"
minio_api_external_port = 9000
minio_console_external_port = 9001

#variables de Alertmanager
alertmanager_image = "prom/alertmanager:v0.27.0"
alertmanager_container_name = "dev_alertmanager"
alertmanager_external_port  = 9095