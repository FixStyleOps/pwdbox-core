#!/bin/bash
# product-srv – install_step3_saz.sh
# Configure security access limiter (SAZ)

echo "==========================================="
echo " product-srv – Step 3: SAZ / Access Limiter Setup"
echo "==========================================="

ZONE=$(cat /opt/product-srv-zone)
BASE="/opt/product-srv-core/$ZONE/docker/access-limiter"

echo "Zone: $ZONE"
echo "Access-limiter path: $BASE"

mkdir -p $BASE

# -------------------------------------------------------------
# NGINX rate-limit proxy (neutral, without domain references)
# -------------------------------------------------------------
cat > $BASE/Dockerfile <<EOF
FROM nginx:alpine
COPY limiter.conf /etc/nginx/conf.d/default.conf
EOF

cat > $BASE/limiter.conf <<EOF
worker_processes auto;

events {
    worker_connections 1024;
}

http {
    # Classic rate limiting (hidden logic)
    limit_req_zone \$binary_remote_addr zone=req_limit:10m rate=5r/s;

    server {
        listen 80;

        location / {
            limit_req zone=req_limit burst=10;
            proxy_pass http://product-auth:8080;
            proxy_set_header Host \$host;
            proxy_set_header X-Real-IP \$remote_addr;
        }
    }
}
EOF

echo ""
echo "[OK] Access-limiter SAZ created."
echo "[OK] Dockerfile + limiter.conf generated."
echo ""
echo "Next: Step 4 – web-auth service build."
