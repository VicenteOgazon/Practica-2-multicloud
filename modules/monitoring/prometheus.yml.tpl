global:
  scrape_interval: 15s

rule_files:
  - "/etc/prometheus/alert-rules.yml"

scrape_configs:
  - job_name: "web_app"
    metrics_path: "/metrics"
    static_configs:
      - targets:
%{ for t in scrape_targets ~}
        - "${t}"
%{ endfor ~}
  - job_name: "cadvisor"
    metrics_path: "/metrics"
    static_configs:
      - targets:
        - "${cadvisor_name}:${cadvisor_port}"