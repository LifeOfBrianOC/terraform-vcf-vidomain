output "network_pool_id" {
  description = "id of workload domain network pool"
  value       = data.vsphere_datacenter.dc.id
}
