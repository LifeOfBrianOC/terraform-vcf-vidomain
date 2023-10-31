provider "vcf" {
  sddc_manager_host = var.sddc_manager_host
  sddc_manager_username = var.sddc_manager_username
  sddc_manager_password = var.sddc_manager_password
  allow_unverified_tls = var.allow_unverified_tls
}

resource "vcf_network_pool" "domain_pool" {
  name    = var.network_pool_name
  network {
    gateway   = var.network_pool_storage_gateway
    mask      = var.network_pool_storage_netmask
    mtu       = var.network_pool_storage_mtu
    subnet    = var.network_pool_storage_subnet
    type      = var.network_pool_storage_type
    vlan_id   = var.network_pool_storage_vlan_id
    ip_pools {
      start = var.network_pool_storage_ip_pool_start_ip
      end   = var.network_pool_storage_ip_pool_end_ip
    }
  }
  network {
    gateway   = var.network_pool_vmotion_gateway
    mask      = var.network_pool_vmotion_netmask
    mtu       = var.network_pool_vmotion_mtu
    subnet    = var.network_pool_vmotion_subnet
    type      = var.network_pool_vmotion_type
    vlan_id   = var.network_pool_vmotion_vlan_id
    ip_pools {
      start = var.network_pool_vmotion_ip_pool_start_ip
      end   = var.network_pool_vmotion_ip_pool_end_ip
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