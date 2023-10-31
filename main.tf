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
  username  = var.esx_host1_username
  password  = var.esx_host1_pass
  network_pool_id = vcf_network_pool.domain_pool.id
  storage_type = var.esx_host1_storage_type
}
resource "vcf_host" "host2" {
  fqdn      = var.esx_host2_fqdn
  username  = var.esx_host2_username
  password  = var.esx_host2_pass
  network_pool_id = vcf_network_pool.domain_pool.id
  storage_type = var.esx_host2_storage_type
}
resource "vcf_host" "host3" {
  fqdn      = var.esx_host3_fqdn
  username  = var.esx_host3_username
  password  = var.esx_host3_pass
  network_pool_id = vcf_network_pool.domain_pool.id
  storage_type = var.esx_host3_storage_type
}
resource "vcf_host" "host4" {
  fqdn      = var.esx_host4_fqdn
  username  = var.esx_host4_username
  password  = var.esx_host4_pass
  network_pool_id = vcf_network_pool.domain_pool.id
  storage_type = var.esx_host4_storage_type
}
resource "vcf_domain" "domain1" {
  name                    = var.vcf_domain_name
  vcenter_configuration {
    name            = var.vcf_domain_vcenter_name
    datacenter_name = var.vcf_domain_vcenter_datacenter_name
    root_password   = var.vcenter_root_password
    vm_size         = var.vcenter_vm_size
    storage_size    = var.vcenter_storage_size
    ip_address      = var.vcenter_ip_address
    subnet_mask     = var.vcenter_subnet_mask
    gateway         = var.vcenter_gateway
    fqdn            = var.vcenter_fqdn
  }
  nsx_configuration {
    vip        					= var.nsx_vip_ip
    vip_fqdn   					= var.nsx_vip_fqdn
    nsx_manager_admin_password	= var.nsx_manager_admin_password
    form_factor                 = var.nsx_manager_form_factor
    license_key                 = var.nsx_license_key
    nsx_manager_node {
      name        = var.nsx_manager_node1_name
      ip_address  = var.nsx_manager_node1_ip_address
      fqdn    = var.nsx_manager_node1_fqdn
      subnet_mask = var.nsx_manager_node1_subnet_mask
      gateway     = var.nsx_manager_node1_gateway
    }
    nsx_manager_node {
      name        = var.nsx_manager_node2_name
      ip_address  = var.nsx_manager_node2_ip_address
      fqdn    = var.nsx_manager_node2_fqdn
      subnet_mask = var.nsx_manager_node2_subnet_mask
      gateway     = var.nsx_manager_node2_gateway
    }
    nsx_manager_node {
      name        = var.nsx_manager_node3_name
      ip_address  = var.nsx_manager_node3_ip_address
      fqdn    = var.nsx_manager_node3_fqdn
      subnet_mask = var.nsx_manager_node3_subnet_mask
      gateway     = var.nsx_manager_node3_gateway
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