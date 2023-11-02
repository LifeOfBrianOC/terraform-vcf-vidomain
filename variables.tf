variable "sddc_manager_fqdn" {
  description = "Fully qualified domain name of an SDDC Manager instance"
  default = ""
  type = string
}
variable "sddc_manager_username" {
  description = "Username used to authenticate against an SDDC Manager instance"
  default = ""
  type = string
}
variable "sddc_manager_password" {
  description = "Password used to authenticate against an SDDC Manager instance"
  default = ""
  type = string
  sensitive = true
}
variable "allow_unverified_tls" {
  description = "Boolean to allow unverified tls"
  default = ""
  type = bool
}
variable "network_pool_name" {
  description = "Name used to create the workload domain network pool"
  default = ""
  type = string
}
variable "network_pool_storage_gateway" {
  description = "Gateway ip address used to create the workload domain storage network pool"
  default = ""
  type = string
}
variable "network_pool_storage_netmask" {
  description = "Subnet mask used to create the workload domain storage network pool"
  default = ""
  type = string
}
variable "network_pool_storage_mtu" {
  description = "MTU used to create the workload domain storage network pool"
  default = ""
  type = number
  validation {
    condition     = var.network_pool_storage_mtu >= 1500 && var.network_pool_storage_mtu <= 65535 && floor(var.network_pool_storage_mtu) == var.network_pool_storage_mtu
    error_message = "Accepted values: 1500-65535."
  }
}
variable "network_pool_storage_subnet" {
  description = "Subnet used to create the workload domain storage network pool"
  default = ""
  type = string
}
variable "network_pool_storage_type" {
  description = "Network pool type used to create the workload domain storage network pool"
  default = ""
  type = string
}
variable "network_pool_storage_vlan_id" {
  description = "VLAN ID used to create the workload domain storage network pool"
  default = ""
  type = number
}
variable "network_pool_storage_ip_pool_start_ip" {
  description = "Start IP used to create the workload domain storage network pool ip pool"
  default = ""
  type = string
}
variable "network_pool_storage_ip_pool_end_ip" {
  description = "End IP used to create the workload domain storage network pool ip pool"
  default = ""
  type = string
}

variable "network_pool_vmotion_gateway" {
  description = "Gateway ip address used to create the workload domain vmotion network pool"
  default = ""
  type = string
}
variable "network_pool_vmotion_netmask" {
  description = "Subnet mask used to create the workload domain vmotion network pool"
  default = ""
  type = string
}
variable "network_pool_vmotion_mtu" {
  description = "MTU used to create the workload domain vmotion network pool"
  default = ""
  type = number
}
variable "network_pool_vmotion_subnet" {
  description = "Subnet used to create the workload domain vmotion network pool"
  default = ""
  type = string
}
variable "network_pool_vmotion_vlan_id" {
  description = "VLAN ID used to create the workload domain vmotion network pool"
  default = ""
  type = number
}
variable "network_pool_vmotion_ip_pool_start_ip" {
  description = "Start IP used to create the workload domain vmotion network pool ip pool"
  default = ""
  type = string
}
variable "network_pool_vmotion_ip_pool_end_ip" {
  description = "End IP used to create the workload domain vmotion network pool ip pool"
  default = ""
  type = string
}
variable "esx_host_storage_type" {
  description = "Principal storage type to assign to ESXi hosts of the default cluster"
  default = ""
  type = string
}
variable "esx_host1_fqdn" {
  description = "Fully qualified domain name of ESXi host 1"
  default = ""
  type = string
}
variable "esx_host1_username" {
  description = "Username to authenticate to the ESXi host 1"
  default = ""
  type = string
}
variable "esx_host1_pass" {
  description = "Password to authenticate to the ESXi host 1"
  default = ""
  type = string
  sensitive = true
}

variable "esx_host2_fqdn" {
  description = "Fully qualified domain name of ESXi host 2"
  default = ""
  type = string
}
variable "esx_host2_username" {
  description = "Username to authenticate to the ESXi host 2"
  default = ""
  type = string
}
variable "esx_host2_pass" {
  description = "Password to authenticate to the ESXi host 2"
  default = ""
  type = string
  sensitive = true
}
variable "esx_host3_fqdn" {
  description = "Fully qualified domain name of ESXi host 3"
  default = ""
  type = string
}

variable "esx_host3_username" {
  description = "Username to authenticate to the ESXi host 3"
  default = ""
  type = string
}
variable "esx_host3_pass" {
  description = "Password to authenticate to the ESXi host 3"
  default = ""
  type = string
  sensitive = true
}
variable "esx_host4_fqdn" {
  description = "Fully qualified domain name of ESXi host 4"
  default = ""
  type = string
}
variable "esx_host4_username" {
  description = "Username to authenticate to the ESXi host 4"
  default = ""
  type = string
}
variable "esx_host4_pass" {
  description = "Password to authenticate to the ESXi host 4"
  default = ""
  type = string
  sensitive = true
}
variable "vcf_domain_name" {
  description = "Name to assign to the workload domain"
  default = ""
  type = string
}
variable "vcf_domain_vcenter_name" {
  description = "Name to assign to the workload domain vCenter Server"
  default = ""
  type = string
}
variable "vcf_domain_vcenter_datacenter_name" {
  description = "Name to assign to the workload domain vCenter Server datacenter"
  default = ""
  type = string
}
variable "vcenter_root_password" {
  description = "root password for the vCenter Server Appliance (8-20 characters)"
  default = ""
  type = string
  sensitive = true
}
variable "vcenter_vm_size" {
  description = "VM deployment size for the vCenter Server Appliance"
  default = ""
  type = string
}
variable "vcenter_storage_size" {
  description = "Storage size for the vCenter Server Appliance"
  default = ""
  type = string
}
variable "vcenter_ip_address" {
  description = "IP address for the vCenter Server Appliance"
  default = ""
  type = string
}
variable "vcenter_subnet_mask" {
  description = "Subnet mask for the vCenter Server Appliance"
  default = ""
  type = string
}
variable "vcenter_gateway" {
  description = "Gateway ip address for the vCenter Server Appliance"
  default = ""
  type = string
}
variable "vcenter_fqdn" {
  description = "FQDN for the vCenter Server Appliance"
  default = ""
  type = string
}
variable "nsx_vip_ip" {
  description = "IP address for the NSX Manager cluster virtual IP"
  default = ""
  type = string
}
variable "nsx_vip_fqdn" {
  description = "FQDN for the NSX Manager cluster virtual IP"
  default = ""
  type = string
}
variable "nsx_manager_admin_password" {
  description = "NSX Manager admin user password"
  default = ""
  type = string
  sensitive = true
}
variable "nsx_manager_form_factor" {
  description = "NSX Manager appliance deployment size"
  default = ""
  type = string
}
variable "nsx_license_key" {
  description = "NSX license to be used"
  type = string
  sensitive = true
}
variable "nsx_manager_node1_name" {
  description = "Name for the first NSX Manager appliance"
  default = ""
  type = string
}
variable "nsx_manager_node1_ip_address" {
  description = "IP address for the first NSX Manager appliance"
  default = ""
  type = string
}
variable "nsx_manager_node1_fqdn" {
  description = "FQDN for the first NSX Manager appliance"
  default = ""
  type = string
}
variable "nsx_manager_node1_subnet_mask" {
  description = "Subnet mask for the first NSX Manager appliance"
  default = ""
  type = string
}
variable "nsx_manager_node1_gateway" {
  description = "Gateway for the first NSX Manager appliance"
  default = ""
  type = string
}
variable "nsx_manager_node2_name" {
  description = "Name for the second NSX Manager appliance"
  default = ""
  type = string
}
variable "nsx_manager_node2_ip_address" {
  description = "IP address for the second NSX Manager appliance"
  default = ""
  type = string
}
variable "nsx_manager_node2_fqdn" {
  description = "FQDN for the second NSX Manager appliance"
  default = ""
  type = string
}
variable "nsx_manager_node2_subnet_mask" {
  description = "Subnet mask for the second NSX Manager appliance"
  default = ""
  type = string
}
variable "nsx_manager_node2_gateway" {
  description = "Gateway for the second NSX Manager appliance"
  default = ""
  type = string
}
variable "nsx_manager_node3_name" {
  description = "Name for the third NSX Manager appliance"
  default = ""
  type = string
}
variable "nsx_manager_node3_ip_address" {
  description = "IP address for the third NSX Manager appliance"
  default = ""
  type = string
}
variable "nsx_manager_node3_fqdn" {
  description = "FQDN for the third NSX Manager appliance"
  default = ""
  type = string
}
variable "nsx_manager_node3_subnet_mask" {
  description = "Subnet mask for the third NSX Manager appliance"
  default = ""
  type = string
}
variable "nsx_manager_node3_gateway" {
  description = "Gateway for the third NSX Manager appliance"
  default = ""
  type = string
}
variable "vsphere_cluster_name" {
  description = "Name for the workload domain vSphere cluster"
  default = ""
  type = string
}
variable "esx_license_key" {
  description = "License key for an ESXi host in the free pool. This is required except in cases where the ESXi host has already been licensed outside of the VMware Cloud Foundation system"
  type = string
  sensitive = true
}
variable "esx_vmnic0" {
  description = "vmnic to be added to vDS"
  default = ""
  type = string
}
variable "vmnic0_vds_name" {
  description = "vDS to which to add vmnic"
  default = ""
  type = string
}
variable "esx_vmnic1" {
  description = "vmnic to be added to vDS"
  default = ""
  type = string
}
variable "vmnic1_vds_name" {
  description = "vDS to which to add vmnic"
  default = ""
  type =string
}
variable "vds_name" {
  description = "Name for the workload domain vDS"
  default = ""
  type = string
}
variable "portgroup_management_name" {
  description = "Name for the management portgroup"
  default = ""
  type = string
}
variable "portgroup_vsan_name" {
  description = "Name for the vSAN portgroup"
  default = ""
  type = string
}
variable "portgroup_vmotion_name" {
  description = "Name for the vMotion portgroup"
  default = ""
}
variable "vsan_datastore_name" {
  description = "Name for the vSAN datastore"
  default = ""
}
variable "vsan_failures_to_tolerate" {
  description = "Failures to tolerate setting for the vSAN datastore"
  default = ""
  type = number
}
variable "vsan_license_key" {
  description = "vSAN license key to be used"
  type = string
  sensitive = true
}
variable "geneve_vlan_id" {
  description = "VLAN id used for NSX geneve traffic"
  default = ""
  type = number
}