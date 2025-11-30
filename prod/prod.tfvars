#variables de la aplicacion web
app_image = "app:prod"
web_container_name = "prod_web"
web_internal_port = 5000
environment = "production"
web_replicas = 3

#variables de la base de datos
db_image = "mysql:8.0"
db_init = "/home/vicente/Escritorio/Grado Ingenieria/4 año/1 Semestre/Redes avanzadas/Practica2/modules/db/init_prod/init.sql"
volume_name = "data_prod"
db_container_name = "prod_db"
db_root_password = "flaskroot"
db_name = "registro_usuarios"
db_user = "flaskuser"
db_password = "flaskpass"

network_name = "prod_network"

#variables de la cache
cache_image = "redis:7.2-alpine"
cache_container_name = "redis_cache"
cache_external_port = 6379
cache_internal_port = 6379

#variables del Load Balancer
lb_image = "nginx:alpine"
lb_container_name = "prod_lb"
lb_listen_port = 6061

#variables de Prometheus
prometheus_container_name = "prod_prometheus"
prometheus_image = "ubuntu/prometheus:3-24.04_stable"
prometheus_internal_port = 9090
prometheus_external_port = 9091

#variables de Grafana
grafana_image = "grafana/grafana:latest"
grafana_container_name = "prod_grafana"
grafana_internal_port = 3000
grafana_external_port = 3001
grafana_admin_user = "admin"
grafana_admin_password = "adminprod"

#variables de cAdvisor
cadvisor_container_name = "prod_cadvisor"
cadvisor_image = "gcr.io/cadvisor/cadvisor:latest"
cadvisor_internal_port = 8080
cadvisor_external_port = 8081

#variables de Loki
loki_container_name = "prod_loki"
loki_image = "grafana/loki:2.9.0"
loki_internal_port = 3100
loki_external_port = 3101

#variables de Promtail
promtail_container_name = "prod_promtail"
promtail_image = "grafana/promtail:2.9.0"

#variables de MinIO
minio_image = "minio/minio:RELEASE.2024-04-18T19-09-19Z"
minio_container_name = "prod_minio"
minio_access_key = "prodminio"
minio_secret_key = "minioprod"
minio_api_external_port = 19000
minio_console_external_port = 19001

#variables de Alertmanager
alertmanager_image = "prom/alertmanager:v0.27.0"
alertmanager_container_name = "prod_alertmanager"
alertmanager_external_port  = 9094
