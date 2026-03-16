terraform {
  required_version = ">= 1.5.0"

  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "~> 3.0.0"
    }
  }
}

# Site 1 (on-prem)
provider "proxmox" {
  alias           = "site1"
  pm_api_url      = var.site1_api_url       # ex: "https://S1-PROXMOX:8006/api2/json"
  pm_api_token_id = var.site1_api_token_id  # ex: "user@pve!tokenname"
  pm_api_token_secret = var.site1_api_token_secret
  pm_tls_insecure = true                    # à mettre à false si tu as du TLS propre
}

# Site 2 (remote)
provider "proxmox" {
  alias           = "site2"
  pm_api_url      = var.site2_api_url
  pm_api_token_id = var.site2_api_token_id
  pm_api_token_secret = var.site2_api_token_secret
  pm_tls_insecure = true
}