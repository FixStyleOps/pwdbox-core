#!/bin/bash
# product-srv – install_step7_ports_map.sh

mkdir -p /opt/product-srv-ports

cat > /opt/product-srv-ports/ports.map <<EOF
alpha-sync=52148
beta-sync=53792
gamma-sync=56411
EOF

echo "[OK] ports-map created"
