#!/bin/bash
# PWDBOX – install_step1_structure.sh
# Create base directory structure for PWDBOX

echo "==========================================="
echo " PWDBOX – Step 1: Creating Core Structure"
echo "==========================================="

# Ask for zone name
read -p "Enter zone (io / asia / kz): " ZONE

# Save zone for all next steps
echo "$ZONE" > /opt/pwdbox-zone

BASE="/opt/pwdbox-core/$ZONE"

echo "Using base path: $BASE"
mkdir -p $BASE

# Core structure
mkdir -p $BASE/docker
mkdir -p $BASE/config
mkdir -p $BASE/scripts
mkdir -p $BASE/logs
mkdir -p $BASE/ui/web-auth-ui
mkdir -p $BASE/backup
mkdir -p $BASE/tmp

# Global system dirs
mkdir -p /opt/pwdbox-installer/data
mkdir -p /opt/scripts
mkdir -p /opt/logs
mkdir -p /opt/backup
mkdir -p /opt/pwdbox-ports

# Save report
REPORT="/opt/pwdbox-installer/install_step1_structure.txt"
echo "PWDBOX Structure Created for zone: $ZONE" > $REPORT
echo "Base directory: $BASE" >> $REPORT
echo "Date: $(date)" >> $REPORT

echo ""
echo "[OK] Base structure created."
echo "[OK] Report saved to $REPORT"
echo ""
echo "Next: Step2 – docker-compose generator."
