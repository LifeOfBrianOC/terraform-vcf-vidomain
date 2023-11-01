terraform {
  required_version = ">= 1.6.2"
  required_providers {
    vcf = {
      source = "vmware/vcf"
      required_version = ">= 0.5.0"
    }
  }
}