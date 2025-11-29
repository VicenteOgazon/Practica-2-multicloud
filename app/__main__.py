import os
from . import create_app

app = create_app()

if __name__ == "__main__":
    # Puerto que le pasas desde Terraform: APP_PORT
    port = int(os.environ.get("APP_PORT", 5000))
    # En contenedor: sin debug y sin reloader
    app.run(host="0.0.0.0", port=port)