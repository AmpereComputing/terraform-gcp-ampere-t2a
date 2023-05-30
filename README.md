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
