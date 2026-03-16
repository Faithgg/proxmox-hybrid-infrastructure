############################
# SITE 2 - REMOTE
############################

resource "proxmox_vm_qemu" "s2_pfsense" {
  provider    = proxmox.site2
  vmid        = var.site2_pfsense_vmid
  name        = "s2-pfsense"
  target_node = var.site2_node

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
    bridge = "vmbr0"   # WAN
  }

  network {
    id     = 1
    model  = "virtio"
    bridge = "vmbr1"   # LAN/DMZ
  }
}

resource "proxmox_vm_qemu" "s2_services" {
  provider    = proxmox.site2
  vmid        = var.site2_services_vmid
  name        = "s2-services"
  target_node = var.site2_node

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
    bridge = "vmbr1"   # LAN services
  }
}

resource "proxmox_vm_qemu" "s2_bastion" {
  provider    = proxmox.site2
  vmid        = var.site2_bastion_vmid
  name        = "s2-bastion"
  target_node = var.site2_node

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
    bridge = "vmbr1"   # LAN admin / DMZ
  }
}