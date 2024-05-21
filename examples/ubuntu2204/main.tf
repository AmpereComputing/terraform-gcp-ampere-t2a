variable "project_id" {}
variable "location" {}

locals {
  cloud_init_template_path = "${path.cwd}/cloud-init.yaml.tpl"
}

module "ampere-t2a" {
        source                   = "github.com/amperecomputing/terraform-gcp-ampere-tau-t2a"  
        project_id               = var.project_id
     #  Optional
     #  virtual_network_name     = var.virtual_network_name
     #  address_space            = var.address_space
     #  subnet_prefix            = var.subnet_prefix
        location                 = "US"
        region                   = "us-central1"
        zone                     = "us-central1-a"
        gcp_vm_count             = 1
        gcp_os_image           = "ubuntu2204"
        instance_prefix          = "ampere-t2a-ubuntu2204"
        startup_script_template_file = null
        cloud_init_template_file     = local.cloud_init_template_path
}

output "ampere_t2a_private_ips" {
  value     = module.ampere-t2a.ampere_t2a_private_ips
}
output "ampere_t2a_public_ips" {
  value     = module.ampere-t2a.ampere_t2a_public_ips
}
~          
