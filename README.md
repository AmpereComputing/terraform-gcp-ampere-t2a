![Ampere Computing](https://avatars2.githubusercontent.com/u/34519842?s=400&u=1d29afaac44f477cbb0226139ec83f73faefe154&v=4)

# terraform-gcp-ampere-tau-t2a

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

## Requirements

 * [Terraform](https://www.terraform.io/downloads.html)
 * [Google Cloud Account](https://cloud.google.com)

## What exactly is Terraform doing

The goal of this code is to supply the minimal ammount of information to quickly have working Ampere Tau2a  instances on Google Cloud.

Addtional tasks performed by this code:

* Dynamically creating sshkeys to use when logging into the instance.
* Dynamically getting region, availability zone and image id..
* Creating necessary core networking configurations for the tenancy
* Rendering metadata to pass into the Ampere A1 instance.
* Launch multiple Ampere taut2a instances with metadata and ssh keys.
* Output IP information to connect to the instance.

To get started clone this repository from GitHub locally.

## Configuration with terraform.tfvars

The easiest way to configure is to use a terraform.tfvars in the project directory.
Please note that Compartment OCID are the same as Tenancy OCID for Root Compartment.
The following is an example of what terraform.tfvars should look like:

```
project_id = "myterraform-123456"
location = "US"
```

### Using as a Module

This can also be used as a terraform module.   The [examples](examples) directory contains example code for module usage showing different operating systems booting with a custom cloud-init templates.   Doing a clone of this repository and changing directory to one of the examples, placing a terraform.tfvars into that directory, and running a typical terrafornm workflow will produce a working virtual machine in the os that was specified in the main.tf that is located within the chosen example directory.

### Running Terraform

```
terraform init && terraform plan && terraform apply -auto-approve
```

<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudinit"></a> [cloudinit](#provider\_cloudinit) | n/a |
| <a name="provider_google"></a> [google](#provider\_google) | n/a |
| <a name="provider_local"></a> [local](#provider\_local) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |
| <a name="provider_template"></a> [template](#provider\_template) | n/a |
| <a name="provider_tls"></a> [tls](#provider\_tls) | n/a |

## Resources

| Name | Type |
|------|------|
| [google_compute_address.static_ip](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address) | resource |
| [google_compute_firewall.ssh](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_instance.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |
| [google_compute_network.vnet](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) | resource |
| [google_compute_subnetwork.vnet](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |
| [google_os_login_ssh_public_key.cache](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/os_login_ssh_public_key) | resource |
| [local_file.gcp-ssh-privkey](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [local_file.gcp-ssh-pubkey](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [random_uuid.random_id](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/uuid) | resource |
| [tls_private_key.gcp](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [cloudinit_config.cloud_config](https://registry.terraform.io/providers/hashicorp/cloudinit/latest/docs/data-sources/config) | data source |
| [google_client_openid_userinfo.me](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_openid_userinfo) | data source |
| [template_file.cloud_config](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.startup_script](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud_init_template_file"></a> [cloud\_init\_template\_file](#input\_cloud\_init\_template\_file) | Optional path for a cloud-init file | `string` | `null` | no |
| <a name="input_gcp_os_image"></a> [gcp\_os\_image](#input\_gcp\_os\_image) | Default OS Image From the Local Vars | `string` | `"debian11"` | no |
| <a name="input_gcp_vcn_cidr_block"></a> [gcp\_vcn\_cidr\_block](#input\_gcp\_vcn\_cidr\_block) | CIDR Address range for GCE Networks | `string` | `"10.2.0.0/16"` | no |
| <a name="input_gcp_vcn_cidr_subnet"></a> [gcp\_vcn\_cidr\_subnet](#input\_gcp\_vcn\_cidr\_subnet) | CIDR Address range for GCE Networks | `string` | `"10.2.1.0/24"` | no |
| <a name="input_gcp_vm_count"></a> [gcp\_vm\_count](#input\_gcp\_vm\_count) | GCE Virtual Machine Count | `number` | `1` | no |
| <a name="input_instance_prefix"></a> [instance\_prefix](#input\_instance\_prefix) | Name prefix for vm instances | `string` | `"ampere-taut2a"` | no |
| <a name="input_location"></a> [location](#input\_location) | Google Location | `string` | `"US"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Google Project ID | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Google Region | `string` | `"us-central1"` | no |
| <a name="input_startup_script_template_file"></a> [startup\_script\_template\_file](#input\_startup\_script\_template\_file) | Optional path for a startup script file | `string` | `null` | no |
| <a name="input_virtual_network_name"></a> [virtual\_network\_name](#input\_virtual\_network\_name) | virtual\_network\_name | `string` | `"terraform-ampere-taut2a"` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | Google Region | `string` | `"us-central1-a"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ampere_taut2a_metadata"></a> [ampere\_taut2a\_metadata](#output\_ampere\_taut2a\_metadata) | Output rendered instance Metadata |
| <a name="output_ampere_taut2a_private_ips"></a> [ampere\_taut2a\_private\_ips](#output\_ampere\_taut2a\_private\_ips) | Output GCE Ampere Instance Private IP(s) |
| <a name="output_ampere_taut2a_public_ips"></a> [ampere\_taut2a\_public\_ips](#output\_ampere\_taut2a\_public\_ips) | Output GCE Ampere Instance Public IP(s) |
| <a name="output_cloud_init"></a> [cloud\_init](#output\_cloud\_init) | Output rendered cloud-init metadata |
| <a name="output_gcp_ssh_private_key"></a> [gcp\_ssh\_private\_key](#output\_gcp\_ssh\_private\_key) | Output GCE SSH private key |
| <a name="output_gcp_ssh_pubic_key"></a> [gcp\_ssh\_pubic\_key](#output\_gcp\_ssh\_pubic\_key) | Output GCE SSH public key |
| <a name="output_my-email"></a> [my-email](#output\_my-email) | Output email address |
| <a name="output_random_uuid"></a> [random\_uuid](#output\_random\_uuid) | Output a randomly generated uuid |
| <a name="output_startup_script"></a> [startup\_script](#output\_startup\_script) | Output rendered startup script |
<!-- END_TF_DOCS -->