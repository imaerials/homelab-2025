resource "proxmox_vm_qemu" "ubuntu" {
  vmid        = 200
  name        = "VM-name"
  target_node = "pve"

  disks {
    ide {
      ide2 {
        cdrom {
          iso = "ISO file"
        }
      }
    }
  }

  ### or for a Clone VM operation
  # clone = "template to clone"

  ### or for a PXE boot VM operation
  # pxe = true
  # boot = "scsi0;net0"
  # agent = 0
}