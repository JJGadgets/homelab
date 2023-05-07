resource "proxmox_vm_qemu" "talos-worker-node-0" {
    name        = "${var.cluster_name}-worker-0"
    iso         = var.iso_image_location
    full_clone  = false
    target_node = "pve-fatman"
    agent       = var.qemu_guest_agent
    vmid        = "230"
    qemu_os     = "l26" # Linux kernel type
    scsihw      = "virtio-scsi-pci"
    memory      = "16384"
    cores       = 8
    sockets     = 1
    numa        = true
    hotplug     = "network,disk,usb"
    network {
        model  = "virtio"
        tag    = var.homelab_vlan
        bridge = var.network_bridge
        macaddr = "4a:10:50:55:00:00"
    }
    network {
        model  = "virtio"
        bridge = var.network_bridge
        tag    = var.pve_vlan
        macaddr = "4a:20:55:00:00:00"
    }
    network {
        model  = "virtio"
        bridge = var.network_bridge
        tag    = var.wifi_vlan
        macaddr = "4a:20:55:10:10:00"
    }
    disk {
        type    = "virtio"
        size    = var.boot_disk_size
        storage = var.boot_disk_storage_pool
    }
}

resource "proxmox_vm_qemu" "talos-worker-node-1" {
    name        = "${var.cluster_name}-worker-1"
    iso         = var.iso_image_location
    full_clone  = false
    target_node = "pve-fatman"
    agent       = var.qemu_guest_agent
    vmid        = "231"
    qemu_os     = "l26" # Linux kernel type
    scsihw      = "virtio-scsi-pci"
    memory      = "16384"
    cores       = 8
    sockets     = 1
    numa        = true
    hotplug     = "network,disk,usb"
    network {
        model  = "virtio"
        tag    = var.homelab_vlan
        bridge = var.network_bridge
        macaddr = "4a:10:50:55:00:01"
    }
    network {
        model  = "virtio"
        bridge = var.network_bridge
        tag    = var.pve_vlan
        macaddr = "4a:20:55:00:00:01"
    }
    network {
        model  = "virtio"
        bridge = var.network_bridge
        tag    = var.wifi_vlan
        macaddr = "4a:20:55:10:10:01"
    }
    disk {
        type    = "virtio"
        size    = var.boot_disk_size
        storage = var.boot_disk_storage_pool
    }
}

resource "proxmox_vm_qemu" "talos-worker-node-2" {
    name        = "${var.cluster_name}-worker-2"
    iso         = var.iso_image_location
    full_clone  = false
    target_node = "pve-fatman"
    agent       = var.qemu_guest_agent
    vmid        = "232"
    qemu_os     = "l26" # Linux kernel type
    scsihw      = "virtio-scsi-pci"
    memory      = "8192"
    cores       = 8
    sockets     = 1
    numa        = true
    hotplug     = "network,disk,usb"
    network {
        model  = "virtio"
        tag    = var.homelab_vlan
        bridge = var.network_bridge
        macaddr = "4a:10:50:55:00:02"
    }
    network {
        model  = "virtio"
        bridge = var.network_bridge
        tag    = var.pve_vlan
        macaddr = "4a:20:55:00:00:02"
    }
    network {
        model  = "virtio"
        bridge = var.network_bridge
        tag    = var.wifi_vlan
        macaddr = "4a:20:55:10:10:02"
    }
    disk {
        type    = "virtio"
        size    = var.boot_disk_size
        storage = var.boot_disk_storage_pool
    }
}
