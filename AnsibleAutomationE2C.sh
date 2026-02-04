#!/bin/bash

# Simple automation script for Ansible
# Usage: ./run-ansible.sh playbook.yml inventory.ini

# Exit immediately if a command fails
set -e

# Check arguments
if [ $# -lt 2 ]; then
  echo "Usage: $0 <playbook.yml> <inventory.ini>"
  exit 1
fi

PLAYBOOK=$1
INVENTORY=$2

# Optional: ask for confirmation
echo "Running Ansible playbook: $PLAYBOOK with inventory: $INVENTORY"
read -p "Proceed? (y/n): " CONFIRM
if [[ "$CONFIRM" != "y" ]]; then
  echo "Cancelled."
  exit 0
fi

# Run the playbook
ansible-playbook -i "$INVENTORY" "$PLAYBOOK"

# Print completion message
echo "✅ Playbook $PLAYBOOK executed successfully."
