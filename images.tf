# Azure Aarch64 Images
locals {
    os_images = {
      rockylinux8 = {
        os_image        = "rocky-linux-8-optimized-gcp-arm64"
        default_os_user = "rockylinux"
        startup_script  = file("${local.startup_script_template_file}")
      }
      rockylinux9 = {
        os_image        = "rocky-linux-9-arm64"
        default_os_user = "rockylinux"
        startup_script  = file("${local.startup_script_template_file}")
      }
      debian11     = {
        os_image        = "debian-11-arm64"
        default_os_user = "debian"
        startup_script  = file("${local.startup_script_template_file}")
      }
      debian12     = {
        os_image        = "debian-12-arm64"
        default_os_user = "debian"
        startup_script  = file("${local.startup_script_template_file}")
      }
      fedoracoreos     = {
        os_image        = "fedora-coreos-stable-arm64"
        default_os_user = "core"
        startup_script  = null
      }
      ubuntu1804     = {
        os_image        = "ubuntu-1804-lts-arm64"
        default_os_user = "ubuntu"
        startup_script  =  null
      }
      ubuntu2004     = {
        os_image        = "ubuntu-2004-lts-arm64"
        default_os_user = "ubuntu"
        startup_script  =  null
      }
      ubuntu2204     = {
        os_image        = "ubuntu-2204-lts-arm64"
        default_os_user = "ubuntu"
        startup_script  =  null
      }
      ubuntu2404     = {
        os_image        = "ubuntu-2404-lts-arm64"
        default_os_user = "ubuntu"
        startup_script  =  null
      }
      sles15     = {
        os_image        = "sles-15-arm64"
        default_os_user = "suse"
        startup_script  =  null
      }
   }
}

data "google_compute_image" fedora_coreos_stable {
  family  = "fedora-coreos-stable-arm64"
  project = "fedora-coreos-cloud" 
}
data "google_compute_image" fedora_coreos_testing {
  family  = "fedora-coreos-testing-arm64"
  project = "fedora-coreos-cloud" 
}
data "google_compute_image" fedora_coreos_next {
  family  = "fedora-coreos-next-arm64"
  project = "fedora-coreos-cloud" 
}
