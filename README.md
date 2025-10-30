![Ampere Computing](https://avatars2.githubusercontent.com/u/34519842?s=400&u=1d29afaac44f477cbb0226139ec83f73faefe154&v=4)

# terraform-gcp-ampere-t2a

[![Source Code](https://img.shields.io/badge/source-GitHub-blue.svg?style=flat)](https://github.com/AmpereComputing/terraform-oci-ampere-a1)
![documentation workflow](https://github.com/AmpereComputing/terraform-oci-ampere-a1/actions/workflows/documentation.yml/badge.svg?label=build&style=flat-square&branch=main)
![release workflow](https://github.com/AmpereComputing/terraform-oci-ampere-a1/actions/workflows/release.yml/badge.svg?label=build&style=flat-square&branch=main)
[![Latest version](https://img.shields.io/github/tag/AmpereComputing/terraform-oci-ampere-a1.svg?label=release&style=flat&maxAge=3600)](https://github.com/AmpereComputing/terraform-oci-ampere-a1/tags)
[![GitHub issues](https://img.shields.io/github/issues/AmpereComputing/terraform-oci-ampere-a1.svg)](https://github.com/AmpereComputing/terraform-oci-ampere-a1/issues)
![Github stars](https://badgen.net/github/stars/AmpereComputing/terraform-oci-ampere-a1?icon=github&label=stars)
![Github last-commit](https://img.shields.io/github/last-commit/AmpereComputing/terraform-oci-ampere-a1)
[![GitHub forks](https://img.shields.io/github/forks/AmpereComputing/terraform-oci-ampere-a1.svg)](https://github.com/AmpereComputing/terraform-oci-ampere-a1/network)
![Github forks](https://badgen.net/github/forks/AmpereComputing/terraform-oci-ampere-a1?icon=github&label=forks)
![GitHub License](https://img.shields.io/github/license/AmpereComputing/terraform-oci-ampere-a1)
![GitHub deployments](https://img.shields.io/github/deployments/AmpereComputing/terraform-gcp-ampere-t2a/github-pages)
![Website](https://img.shields.io/website?url=https%3A%2F%2Famperecomputing.github.io/terraform-oci-ampere-a1)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
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

### Running OpenTofu

```
tofu init && tofu plan && tofu apply -auto-approve

```

### Logging in

Once everthing as executed, properly you'll need to login.   Currently I successfully login via my google cloud email account in the following format.   <username>_<domain>_<tld>  Where the "@" symbal and "." are replaces with underscores.

for example:

```
ssh -i
```
### OS Images
Reference for OS images
[https://cloud.google.com/compute/docs/images/os-details](https://cloud.google.com/compute/docs/images/os-details)

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->
