#!/bin/bash
# product-srv – install_step1_structure.sh
# Create base directory structure

echo "==========================================="
echo " product-srv – Step 1: Creating Core Structure"
echo "==========================================="

read -p "Enter zone name (example: io / asia / kz): " ZONE

echo "$ZONE" > /opt/product-srv-zone

BASE="/opt/product-srv-core/$ZONE"

echo "Using base directory: $BASE"

mkdir -p $BASE
mkdir -p $BASE/docker
mkdir -p $BASE/config
mkdir -p $BASE/scripts
mkdir -p $BASE/logs
mkdir -p $BASE/ui/web-auth-ui
mkdir -p $BASE/backup
mkdir -p $BASE/tmp

mkdir -p /opt/product-srv-installer/data
mkdir -p /opt/scripts
mkdir -p /opt/logs
mkdir -p /opt/backup
mkdir -p /opt/product-srv-ports

REPORT="/opt/product-srv-installer/install_step1_structure.txt"

echo "product-srv structure created for zone: $ZONE" > $REPORT
echo "Base directory: $BASE" >> $REPORT
echo "Date: $(date)" >> $REPORT

echo ""
echo "[OK] Base structure created."
echo "[OK] Report saved to $REPORT"


