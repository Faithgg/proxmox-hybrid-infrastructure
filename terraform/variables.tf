#######################
# Variables Proxmox
#######################

variable "site1_api_url" {
  description = "URL API Proxmox du site 1"
  type        = string
}

variable "site1_api_token_id" {
  description = "Token ID Proxmox site 1"
  type        = string
  sensitive   = true
}

variable "site1_api_token_secret" {
  description = "Token secret Proxmox site 1"
  type        = string
  sensitive   = true
}

variable "site2_api_url" {
  description = "URL API Proxmox du site 2"
  type        = string
}

variable "site2_api_token_id" {
  description = "Token ID Proxmox site 2"
  type        = string
  sensitive   = true
}

variable "site2_api_token_secret" {
  description = "Token secret Proxmox site 2"
  type        = string
  sensitive   = true
}

#######################
# Variables Site 1
#######################

variable "site1_node" {
  description = "Nom du nœud Proxmox pour le site 1 (ex: pve-s1)"
  type        = string
}

variable "site1_pfsense_vmid" {
  description = "VMID de la VM pfSense site 1 déjà existante"
  type        = number
}

variable "site1_services_vmid" {
  description = "VMID de la VM services (NetBox/Elastic/site) site 1"
  type        = number
}

variable "site1_bastion_vmid" {
  description = "VMID de la VM bastion site 1 (si existante)"
  type        = number
}

variable "site1_lan_cidr" {
  description = "CIDR LAN site 1 (ex: 10.10.10.0/24)"
  type        = string
}

#######################
# Variables Site 2
#######################

variable "site2_node" {
  description = "Nom du nœud Proxmox pour le site 2 (ex: pve-s2)"
  type        = string
}

variable "site2_pfsense_vmid" {
  description = "VMID de la VM pfSense site 2 déjà existante"
  type        = number
}

variable "site2_services_vmid" {
  description = "VMID de la VM services site 2"
  type        = number
}

variable "site2_bastion_vmid" {
  description = "VMID de la VM bastion site 2"
  type        = number
}

variable "site2_lan_cidr" {
  description = "CIDR LAN site 2 (ex: 10.20.20.0/24)"
  type        = string
}