upstream backend {
%{ for b in backends ~}
    server ${b}:${backend_port};
%{ endfor ~}
}

server {
    listen ${listen_port};

    location / {
        proxy_pass http://backend;
    }
}