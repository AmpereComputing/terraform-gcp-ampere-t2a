#cloud-config

package_update: true
package_upgrade: true

packages:
  - tmux
  - rsync
  - git

groups:
  - docker
system_info:
  default_user:
    groups: [docker]

runcmd:
  - echo 'Ampere T2A SLES 15 Example' >> /etc/motd
