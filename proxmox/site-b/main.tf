terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.9.14"
    }
  }
}

variable "proxmox_token" {
  description = "Proxmox API token secret"
  type        = string
  sensitive   = true
}

provider "proxmox" {
  pm_api_url = "https://ns3183326.ip-146-59-253.eu:8006/api2/json"
  pm_api_token_id     = "GR40@pve!terraform"
  pm_api_token_secret = var.proxmox_token
  pm_tls_insecure = true
}

resource "proxmox_vm_qemu" "pfsense_site_b" {
  name        = "pf-GR40"
  target_node = "vm002"
}

resource "proxmox_vm_qemu" "vm1_site_b" {
  name        = "VM1-GR40"
  target_node = "vm002"
}

resource "proxmox_vm_qemu" "vm2_site_b" {
  name        = "VM2-GR40"
  target_node = "vm002"
}