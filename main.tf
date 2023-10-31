terraform {
  required_providers {
    vcf = {
      source = "vmware/vcf"
    }
  }
}
provider "vcf" {
  sddc_manager_host = var.sddc_manager_host
  sddc_manager_username = var.sddc_manager_username
  sddc_manager_password = var.sddc_manager_password
  allow_unverified_tls = true
}

resource "vcf_network_pool" "domain_pool" {
  name    = "sfo-w01-np01"
  network {
    gateway   = "172.16.13.1"
    mask      = "255.255.255.0"
    mtu       = 8900
    subnet    = "172.16.13.0"
    type      = "VSAN"
    vlan_id   = 1613
    ip_pools {
      start = "172.16.13.5"
      end   = "172.16.13.50"
    }
  }
  network {
    gateway   = "172.16.12.1"
    mask      = "255.255.255.0"
    mtu       = 8900
    subnet    = "172.16.12.0"
    type      = "vMotion"
    vlan_id   = 1612
    ip_pools {
      start = "172.16.12.5"
      end   = "172.16.12.50"
    }
  }
}

resource "vcf_host" "host1" {
  fqdn      = var.esx_host1_fqdn
  username  = "root"
  password  = var.esx_host1_pass
  network_pool_id = vcf_network_pool.domain_pool.id
  storage_type = "VSAN"
}
resource "vcf_host" "host2" {
  fqdn      = var.esx_host2_fqdn
  username  = "root"
  password  = var.esx_host2_pass
  network_pool_id = vcf_network_pool.domain_pool.id
  storage_type = "VSAN"
}
resource "vcf_host" "host3" {
  fqdn      = var.esx_host3_fqdn
  username  = "root"
  password  = var.esx_host3_pass
  network_pool_id = vcf_network_pool.domain_pool.id
  storage_type = "VSAN"
}
resource "vcf_domain" "domain1" {
  name                    = "sfo-w01"
  vcenter_configuration {
    name            = "sfo-w01.vc01"
    datacenter_name = "sfo-w01.dc01"
    root_password   = var.vcenter_root_password
    vm_size         = "small"
    storage_size    = "lstorage"
    ip_address      = "172.16.11.130"
    subnet_mask     = "255.255.255.0"
    gateway         = "172.16.11.1"
    fqdn            = "sfo-w01-vc01.sfo.rainpole.io"
  }
  nsx_configuration {
    vip        					= "172.16.11.131"
    vip_fqdn   					= "sfo-w01-nsx01.sfo.rainpole.io"
    nsx_manager_admin_password	= var.nsx_manager_admin_password
    form_factor                 = "small"
    license_key                 = var.nsx_license_key
    nsx_manager_node {
      name        = "sfo-w01-nsx01a"
      ip_address  = "172.16.11.132"
      fqdn    = "sfo-w01-nsx01a.sfo.rainpole.io"
      subnet_mask = "255.255.255.0"
      gateway     = "172.16.11.1"
    }
    nsx_manager_node {
      name        = "sfo-w01-nsx01b"
      ip_address  = "172.16.11.133"
      fqdn    = "sfo-w01-nsx01b.sfo.rainpole.io"
      subnet_mask = "255.255.255.0"
      gateway     = "172.16.11.1"
    }
    nsx_manager_node {
      name        = "sfo-w01-nsx01c"
      ip_address  = "172.16.11.134"
      fqdn    = "sfo-w01-nsx01c.sfo.rainpole.io"
      subnet_mask = "255.255.255.0"
      gateway     = "172.16.11.1"
    }
  }
  cluster {
    name = "sfo-w01-cl01"
    host {
      id = vcf_host.host1.id
      license_key = var.esx_license_key
      vmnic {
        id = "vmnic0"
        vds_name = "sfo-w01-cl01-vds01"
      }
      vmnic {
        id = "vmnic1"
        vds_name = "sfo-w01-cl01-vds01"
      }
    }
    host {
      id = vcf_host.host2.id
      license_key = var.esx_license_key
      vmnic {
        id = "vmnic0"
        vds_name = "sfo-w01-cl01-vds01"
      }
      vmnic {
        id = "vmnic1"
        vds_name = "sfo-w01-cl01-vds01"
      }
    }
    host {
      id = vcf_host.host3.id
      license_key = var.esx_license_key
      vmnic {
        id = "vmnic0"
        vds_name = "sfo-w01-cl01-vds01"
      }
      vmnic {
        id = "vmnic1"
        vds_name = "sfo-w01-cl01-vds01"
      }
    }
    vds {
      name = "sfo-w01-cl01-vds01"
      portgroup {
        name = "sfo-w01-cl01-vds01-pg-mgmt"
        transport_type = "MANAGEMENT"
      }
      portgroup {
        name = "sfo-w01-cl01-vds01-pg-vsan"
        transport_type = "VSAN"
      }
      portgroup {
        name = "sfo-w01-cl01-vds01-pg-vmotion"
        transport_type = "VMOTION"
      }
    }
    vsan_datastore {
      datastore_name = "sfo-w01-cl01-ds-vsan01"
      failures_to_tolerate = 1
      license_key = var.vsan_license_key
    }
    geneve_vlan_id = 1634
  }
}