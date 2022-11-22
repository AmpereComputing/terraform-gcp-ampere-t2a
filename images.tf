# Azure Aarch64 Images
locals {
    os_images = {
      rockylinux9 = {
        os_image        = "rocky-linux-9-arm64"
        default_os_user = "rockylinux"
        startup_script  = data.template_file.startup_script.rendered
      }
      debian11     = {
        os_image        = "debian-11-arm64"
        default_os_user = "debian"
        startup_script  = data.template_file.startup_script.rendered
      }
      ubuntu2204     = {
        os_image        = "ubuntu-2204-lts-arm64"
        default_os_user = "ubuntu"
        startup_script  =  null
      }
   }
}
