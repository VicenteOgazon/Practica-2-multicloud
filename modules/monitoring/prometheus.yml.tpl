global:
  scrape_interval: 15s

scrape_configs:
  - job_name: "web_app"
    metrics_path: "/metrics"
    static_configs:
      - targets:
%{ for t in scrape_targets ~}
        - "${t}"
%{ endfor ~}