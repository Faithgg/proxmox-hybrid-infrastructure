#!/usr/bin/env bash
set -euo pipefail

# 1. Récupérer secrets depuis Vault
echo "📥 Récupération des secrets depuis Vault..."

vault kv get -field=url ci-kv/proxmox/site1 > .vault_site1_url
vault kv get -field=user ci-kv/proxmox/site1 > .vault_site1_user
vault kv get -field=password ci-kv/proxmox/site1 > .vault_site1_password
vault kv get -field=url ci-kv/proxmox/site2 > .vault_site2_url
vault kv get -field=user ci-kv/proxmox/site2 > .vault_site2_user
vault kv get -field=password ci-kv/proxmox/site2 > .vault_site2_password

# 2. Exporter pour Ansible (vault_*) 
export VAULT_PROXMOX_SITE1_URL=$(cat .vault_site1_url)
export VAULT_PROXMOX_SITE1_USER=$(cat .vault_site1_user)
export VAULT_PROXMOX_SITE1_PASSWORD=$(cat .vault_site1_password)
export VAULT_PROXMOX_SITE2_URL=$(cat .vault_site2_url)
export VAULT_PROXMOX_SITE2_USER=$(cat .vault_site2_user)
export VAULT_PROXMOX_SITE2_PASSWORD=$(cat .vault_site2_password)

# 3. Nettoyer les fichiers temporaires
rm .vault_* 2>/dev/null || true

# 4. Lancer Ansible
cd infra/ansible
ansible-playbook "$@"
