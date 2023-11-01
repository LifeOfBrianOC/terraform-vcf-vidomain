variable "sddc_manager_host" {
  description = "Fully qualified domain name of an SDDC Manager instance"
  default = "sfo-vcf01.sfo.rainpole.io"
}
variable "sddc_manager_username" {
  description = "Username used to authenticate against an SDDC Manager instance"
  default = "administrator@vsphere.local"
}
variable "sddc_manager_password" {
  description = "Password used to authenticate against an SDDC Manager instance"
  default = "VMw@re1!"
}
variable "allow_unverified_tls" {
  description = "Boolean to allow unverified tls"
  default = true
}
variable "network_pool_name" {
  description = "Name used to create the workload domain network pool"
  default = "sfo-w01-np"
}
variable "network_pool_storage_gateway" {
  description = "Gateway ip address used to create the workload domain storage network pool"
  default = "172.16.33.1"
}
variable "network_pool_storage_netmask" {
  description = "Subnet mask used to create the workload domain storage network pool"
  default = "255.255.255.0"
}
variable "network_pool_storage_mtu" {
  description = "MTU used to create the workload domain storage network pool"
  default = 8900
}
variable "network_pool_storage_subnet" {
  description = "Subnet used to create the workload domain storage network pool"
  default = "172.16.33.0"
}
variable "network_pool_storage_type" {
  description = "Network pool type used to create the workload domain storage network pool"
  default = "VSAN"
}
variable "network_pool_storage_vlan_id" {
  description = "VLAN ID used to create the workload domain storage network pool"
  default = 1633
}
variable "network_pool_storage_ip_pool_start_ip" {
  description = "Start IP used to create the workload domain storage network pool ip pool"
  default = "172.16.33.101"
}
variable "network_pool_storage_ip_pool_end_ip" {
  description = "End IP used to create the workload domain storage network pool ip pool"
  default = "172.16.33.108"
}

variable "network_pool_vmotion_gateway" {
  description = "Gateway ip address used to create the workload domain vmotion network pool"
  default = "172.16.32.1"
}
variable "network_pool_vmotion_netmask" {
  description = "Subnet mask used to create the workload domain vmotion network pool"
  default = "255.255.255.0"
}
variable "network_pool_vmotion_mtu" {
  description = "MTU used to create the workload domain vmotion network pool"
  default = 8900
}
variable "network_pool_vmotion_subnet" {
  description = "Subnet used to create the workload domain vmotion network pool"
  default = "172.16.32.0"
}
variable "network_pool_vmotion_type" {
  description = "Network pool type used to create the workload domain vmotion network pool"
  default = "vMotion"
}
variable "network_pool_vmotion_vlan_id" {
  description = "VLAN ID used to create the workload domain vmotion network pool"
  default = 1632
}
variable "network_pool_vmotion_ip_pool_start_ip" {
  description = "Start IP used to create the workload domain vmotion network pool ip pool"
  default = "172.16.32.101"
}
variable "network_pool_vmotion_ip_pool_end_ip" {
  description = "End IP used to create the workload domain vmotion network pool ip pool"
  default = "172.16.32.108"
}
variable "esx_host1_fqdn" {
  description = "Fully qualified domain name of ESXi host 1"
  default = "sfo01-w01-esx01.sfo.rainpole.io"
}
variable "esx_host1_username" {
  description = "Username to authenticate to the ESXi host 1"
  default = "root"
}
variable "esx_host1_pass" {
  description = "Password to authenticate to the ESXi host 1"
  default = "VMw@re1!"
}
variable "esx_host1_storage_type" {
  description = "Storage type to assign to ESXi host 1"
  default = "VSAN"
}
variable "esx_host2_fqdn" {
  description = "Fully qualified domain name of ESXi host 2"
  default = "sfo01-w01-esx02.sfo.rainpole.io"
}
variable "esx_host2_username" {
  description = "Username to authenticate to the ESXi host 2"
  default = "root"
}
variable "esx_host2_pass" {
  description = "Password to authenticate to the ESXi host 2"
  default = "VMw@re1!"
}
variable "esx_host2_storage_type" {
  description = "Storage type to assign to ESXi host 2"
  default = "VSAN"
}
variable "esx_host3_fqdn" {
  description = "Fully qualified domain name of ESXi host 3"
  default = "sfo01-w01-esx03.sfo.rainpole.io"
}

variable "esx_host3_username" {
  description = "Username to authenticate to the ESXi host 3"
  default = "root"
}
variable "esx_host3_pass" {
  description = "Password to authenticate to the ESXi host 3"
  default = "VMw@re1!"
}
variable "esx_host3_storage_type" {
  description = "Storage type to assign to ESXi host 3"
  default = "VSAN"
}
variable "esx_host4_fqdn" {
  description = "Fully qualified domain name of ESXi host 4"
  default = "sfo01-w01-esx04.sfo.rainpole.io"
}
variable "esx_host4_username" {
  description = "Username to authenticate to the ESXi host 4"
  default = "root"
}
variable "esx_host4_pass" {
  description = "Password to authenticate to the ESXi host 4"
  default = "VMw@re1!"
}
variable "esx_host4_storage_type" {
  description = "Storage type to assign to ESXi host 4"
  default = "VSAN"
}
variable "vcf_domain_name" {
  description = "Name to assign to the workload domain"
  default = "sfo-w01"
}
variable "vcf_domain_vcenter_name" {
  description = "Name to assign to the workload domain vCenter Server"
  default = "sfo-w01-vc01"
}
variable "vcf_domain_vcenter_datacenter_name" {
  description = "Name to assign to the workload domain vCenter Server datacenter"
  default = "sfo-w01-dc01"
}
variable "vcenter_root_password" {
  description = "root password for the vCenter Server Appliance (8-20 characters)"
  default = "VMw@re1!"
}
variable "vcenter_vm_size" {
  description = "VM deployment size for the vCenter Server Appliance"
  default = "small"
}
variable "vcenter_storage_size" {
  description = "Storage size for the vCenter Server Appliance"
  default = "lstorage"
}
variable "vcenter_ip_address" {
  description = "IP address for the vCenter Server Appliance"
  default = "172.16.11.130"
}
variable "vcenter_subnet_mask" {
  description = "Subnet mask for the vCenter Server Appliance"
  default = "255.255.255.0"
}
variable "vcenter_gateway" {
  description = "Gateway ip address for the vCenter Server Appliance"
  default = "172.16.11.1"
}
variable "vcenter_fqdn" {
  description = "FQDN for the vCenter Server Appliance"
  default = "sfo-w01-vc01.sfo.rainpole.io"
}
variable "nsx_vip_ip" {
  description = "IP address for the NSX Manager cluster virtual IP"
  default = "172.16.11.131"
}
variable "nsx_vip_fqdn" {
  description = "FQDN for the NSX Manager cluster virtual IP"
  default = "sfo-w01-nsx01.sfo.rainpole.io"
}
variable "nsx_manager_admin_password" {
  description = "NSX Manager admin user password"
  default = "VMw@re1!VMw@re1!"
}
variable "nsx_manager_form_factor" {
  description = "NSX Manager appliance deployment size"
  default = "small"
}
variable "nsx_license_key" {
  description = "NSX license to be used"
}
variable "nsx_manager_node1_name" {
  description = "Name for the first NSX Manager appliance"
  default = "sfo-w01-nsx01a"
}
variable "nsx_manager_node1_ip_address" {
  description = "IP address for the first NSX Manager appliance"
  default = "172.16.11.132"
}
variable "nsx_manager_node1_fqdn" {
  description = "FQDN for the first NSX Manager appliance"
  default = "sfo-w01-nsx01a.sfo.rainpole.io"
}
variable "nsx_manager_node1_subnet_mask" {
  description = "Subnet mask for the first NSX Manager appliance"
  default = "255.255.255.0"
}
variable "nsx_manager_node1_gateway" {
  description = "Gateway for the first NSX Manager appliance"
  default = "172.16.11.1"
}
variable "nsx_manager_node2_name" {
  description = "Name for the second NSX Manager appliance"
  default = "sfo-w01-nsx02a"
}
variable "nsx_manager_node2_ip_address" {
  description = "IP address for the second NSX Manager appliance"
  default = "172.16.11.133"
}
variable "nsx_manager_node2_fqdn" {
  description = "FQDN for the second NSX Manager appliance"
  default = "sfo-w01-nsx02a.sfo.rainpole.io"
}
variable "nsx_manager_node2_subnet_mask" {
  description = "Subnet mask for the second NSX Manager appliance"
  default = "255.255.255.0"
}
variable "nsx_manager_node2_gateway" {
  description = "Gateway for the second NSX Manager appliance"
  default = "172.16.11.1"
}
variable "nsx_manager_node3_name" {
  description = "Name for the third NSX Manager appliance"
  default = "sfo-w01-nsx03a"
}
variable "nsx_manager_node3_ip_address" {
  description = "IP address for the third NSX Manager appliance"
  default = "172.16.11.134"
}
variable "nsx_manager_node3_fqdn" {
  description = "FQDN for the third NSX Manager appliance"
  default = "sfo-w01-nsx03a.sfo.rainpole.io"
}
variable "nsx_manager_node3_subnet_mask" {
  description = "Subnet mask for the third NSX Manager appliance"
  default = "255.255.255.0"
}
variable "nsx_manager_node3_gateway" {
  description = "Gateway for the third NSX Manager appliance"
  default = "172.16.11.1"
}
variable "vsphere_cluster_name" {
  description = "Name for the workload domain vSphere cluster"
  default = "sfo-w01-cl01"
}
variable "esx_license_key" {
  description = "License key for an ESXi host in the free pool. This is required except in cases where the ESXi host has already been licensed outside of the VMware Cloud Foundation system"
}
variable "esx_vmnic0" {
  description = "vmnic to be added to vDS"
  default = "vmnic0"
}
variable "vmnic0_vds_name" {
  description = "vDS to which to add vmnic"
  default = "sfo-w01-cl01-vds01"
}
variable "esx_vmnic1" {
  description = "vmnic to be added to vDS"
  default = "vmnic1"
}
variable "vmnic1_vds_name" {
  description = "vDS to which to add vmnic"
  default = "sfo-w01-cl01-vds01"
}
variable "vds_name" {
  description = "Name for the workload domain vDS"
  default = "sfo-w01-cl01-vds01"
}
variable "portgroup_management_name" {
  description = "Name for the management portgroup"
  default = "sfo-w01-cl01-vds01-pg-mgmt"
}
variable "portgroup_vsan_name" {
  description = "Name for the vSAN portgroup"
  default = "sfo-w01-cl01-vds01-pg-vsan"
}
variable "portgroup_vmotion_name" {
  description = "Name for the vMotion portgroup"
  default = "sfo-w01-cl01-vds01-pg-vmotion"
}
variable "vsan_datastore_name" {
  description = "Name for the vSAN datastore"
  default = "sfo-w01-cl01-ds-vsan01"
}
variable "vsan_failures_to_tolerate" {
  description = "Failures to tolerate setting for the vSAN datastore"
  default = 1
}
variable "vsan_license_key" {
  description = "vSAN license key to be used"
}
variable "geneve_vlan_id" {
  description = "VLAN id used for NSX geneve traffic"
  default = 1634
}