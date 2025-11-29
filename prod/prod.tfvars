app_image = "app:prod"
web_container_name = "prod_web"
web_internal_port = 5000
environment = "production"
web_replicas = 3

db_image = "mysql:8.0"
db_init = "/home/vicente/Escritorio/Grado Ingenieria/4 año/1 Semestre/Redes avanzadas/Practica2/modules/db/init_prod/init.sql"
volume_name = "data_prod"
db_container_name = "prod_db"
db_root_password = "flaskroot"
db_name = "registro_usuarios"
db_user = "flaskuser"
db_password = "flaskpass"

network_name = "prod_network"

cache_image = "redis:7.2-alpine"
cache_container_name = "redis_cache"
cache_external_port = 6379
cache_internal_port = 6379

lb_image = "nginx:alpine"
lb_container_name = "prod_lb"
lb_listen_port = 8081