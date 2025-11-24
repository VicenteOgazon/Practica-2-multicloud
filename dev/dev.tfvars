app_image = "app:dev"
web_container_name = "dev_web_container"
web_internal_port = 5000
web_external_port = 5005
web_host_path = "/home/vicente/Escritorio/Grado Ingenieria/4 año/1 Semestre/Redes avanzadas/Practica2/app/"
web_container_path = "/app"
environment = "development"
use_local_code = true
flask_debug = "1"

db_image = "mysql:8.0"
db_init = "/home/vicente/Escritorio/Grado Ingenieria/4 año/1 Semestre/Redes avanzadas/Practica2/modules/db/init_dev/init.sql"
volume_name = "data_dev"
db_container_name = "dev_db_container"
db_root_password = "flaskrootdev"
db_name = "registro_usuarios_dev"
db_user = "flaskuserdev"
db_password = "flaskpassdev"

network_name = "dev_network"