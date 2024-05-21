#cloud-config

package_update: true
package_upgrade: true

packages:
  - tmux
  - rsync
  - git

runcmd:
  - echo 'Ampere T2A OpenSuse Leap Example' >> /etc/motd
