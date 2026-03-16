############################
# SITE 1 - ON-PREM
############################

resource "proxmox_vm_qemu" "s1_pfsense" {
  provider    = proxmox.site1
  vmid        = var.site1_pfsense_vmid
  name        = "s1-pfsense"
  target_node = var.site1_node

  # IMPORTANT : copier la config réelle de la VM
  memory      = 2048
  cores       = 2
  sockets     = 1
  onboot      = 1
  agent       = 1

  # Exemple simplifié de disque et NIC, adapte aux valeurs de ton Proxmox
  disk {
    id           = 0
    type         = "scsi"
    storage      = "local-lvm"
    size         = "20G"
  }

  network {
    id     = 0
    model  = "virtio"
    bridge = "vmbr0"   # ex: WAN
  }

  network {
    id     = 1
    model  = "virtio"
    bridge = "vmbr1"   # ex: LAN/DMZ
  }
}

resource "proxmox_vm_qemu" "s1_services" {
  provider    = proxmox.site1
  vmid        = var.site1_services_vmid
  name        = "s1-services"
  target_node = var.site1_node

  memory      = 4096
  cores       = 2
  sockets     = 1
  onboot      = 1
  agent       = 1

  disk {
    id      = 0
    type    = "scsi"
    storage = "local-lvm"
    size    = "50G"
  }

  network {
    id     = 0
    model  = "virtio"
    bridge = "vmbr1"   # LAN/Services
  }
}

resource "proxmox_vm_qemu" "s1_bastion" {
  provider    = proxmox.site1
  vmid        = var.site1_bastion_vmid
  name        = "s1-bastion"
  target_node = var.site1_node

  memory      = 2048
  cores       = 2
  sockets     = 1
  onboot      = 1
  agent       = 1

  disk {
    id      = 0
    type    = "scsi"
    storage = "local-lvm"
    size    = "20G"
  }

  network {
    id     = 0
    model  = "virtio"
    bridge = "vmbr1"   # LAN admin ou DMZ suivant ton design
  }
}