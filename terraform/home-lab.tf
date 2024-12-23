resource "proxmox_vm_qemu" "ubuntu" {
  cpu_type    = "host"
  agent       = 1 
  vmid        = 200
  name        = "Production"
  target_node = "pve"
  bios        = "ovmf"
  memory      = 2048
  cores       = 2
  sockets     = 1
  scsihw      = "virtio-scsi-pci"
  qemu_os     = "l26"
  os_type    = "cloud-init"
  clone = "ubuntu-template"
  # full_clone = true
  hotplug = "disk,network,usb"
  network {
    model  = "virtio"
    bridge = "vmbr0"
    id     = 0  
  }

  disk {
    slot         = "scsi0"
    size         = "20G"
    storage      = "local-lvm"
    type         = "disk"
    cache        = "writethrough"
  }
  disk {
    slot         = "ide2"
    storage      = "local-lvm"
    type         = "cloudinit"
    }
}