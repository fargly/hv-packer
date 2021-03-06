# Changelog

## Version 1.0.6 2018-12-11

* [Windows] added `Windows Server 1809` as `hv_win2016_1809_g2.json`
* [Windows] removed `Windows Server 1709` as obsoleted
* [Windows] lock `puppet-agent` on version 5.5.8
* [Windows] set `Disable-WindowsErrorReporting` for Windows based machines
* [CentOS] added CentOS 7.6 as `hv_centos76_g2.json`
* [CentOS] remove port 8140 from firewalld configuration
* [CentOS] change zabbix repository to version 4.x (won't work with Zabbix server below 4.x)
* [CentOS] added log cleaning/rotating after build
* [CentOS] upgraded SCVMM agent to version 1.0.3.1022. For older SCVMM older agent (1.0.2) is also available
* [Windows] added `phase5b-docker.ps1` for Windows's based docker. You can choose which version you'll require inside the script. Also, if `$installCompose = $true` is true, docker-compose will also be installed

## Version 1.0.5 2018-10-03

* updated `extra`
* tested with packer 1.3.0/1.3.1/1.3.2-dev
* [CentOS] removed `hv_centos74_g2`
* [Windows] added support for `Windows Server 1803 Edition (Standard)`
* [Windows] workarounded [https://github.com/hashicorp/packer/issues/6733](https://github.com/hashicorp/packer/issues/6733) by using `pause_before` and `restart_check_command`
* [Windows] removed `hv_win2016_g1`

## Version 1.0.4 2018-05-21

* fixed some inconsistency in `extra` scripts when creating registry entries
* [Windows] fixed `boostrap.ps1` for Windows based machines (inproper output for network list)
* [CentOS] fixes in CentOS `'provision.sh` to include proper config for neofetch
* [CentOS] switch to `neofetch`, reworked motd.sh to use neofetch with config (instead of defaults)
* [CentOS] added `screen` as essential package for CentOS
* added `azure-placeholder.sh` for Azure-related CentOS machines
* switched to packer 1.2.3
* added `disk_block_size` with 1 MiB for Linux/CentOS machines

## Version 1.0.3 2018-02-23

* `BREAKING FEATURE` - preparing switching to submodules/subtree for ./scripts and ./files - to share common code with other providers
* tree structure in `./scripts` and `./files`, moved to `./extras`
* [Windows] adding `phase-3.ps1` script to put less generic stuff there. Just uncomment line with `exit` to get rid of it
* [Windows] added support for `Windows Server 1709 Edition (Standard)`
* [Windows] remove some clutter from `bootstrap.ps1`
* [Windows] added `exit 0` for most of the scripts as some external commands were leaving packer with non-zero exit codes
* [CentOS] added `zeroing.sh` script to make compacting more efficient
* [CentOS] reworked bug with UEFI - this time after deploying from image you can run sscript `/usr/local/bin/uefi.sh` which will recheck and readd CentOS UEFI entries. For SCVMM deployments (which separates vhdx from vmcx) use `RunOnce`
* [CentOS] removed clutter from `provision.sh`
* [CentOS] removed screenfetch, replaced with neofetch
* [CentOS] reworked `motd.sh` in `/etc/profile.d` to reflect .Xauthority existence

## Version 1.0.2 2017-12-17

* workaround for PS module `PSWindowsUpdate` in Windows Templates
* added `nmon`, `jq` and `sssd-libwebclient` to CentOS 7.4 template
* added `temp_path` in templates to point creation of VMs to current script's folder
* tested with packer 1.1.3
* added variable `vlan_id`
* added variable `switch_name`
* resized OS images to 70GB (Windows)
* sector-size change in  PS cleaning script (from 64k to 4MB - double the speed)

## Version 1.0.1

* documentation fixes

## Version 1.0.0

* initial release for github

## prerelease versions

* serious bug with UEFI partitioning in CentOS 7.x generation 2 - `Unable to find \EFI\BOOT\grubx64.efi` [https://blogs.msdn.microsoft.com/virtual_pc_guy/2015/02/11/copying-the-vhd-of-a-generation-2-linux-vmand-not-booting-afterwards/](https://blogs.msdn.microsoft.com/virtual_pc_guy/2015/02/11/copying-the-vhd-of-a-generation-2-linux-vmand-not-booting-afterwards/)
* disabled libvirtd in CentOS 7.4 template
* added support for SystemCenter VMM Linux Agent for CentOS Gen 2 machines - it's required in case of per-template deployment
* changed firewalld default configuration
  * default zone set from `public` to `work`
  * default set of rules for zone 'work'
  * assigning interface `eth0` to zone `work`
  * remove excessive logging for
* changed `/etc/profile.d/motd.sh` to adjust missing XAUTHORITY variable
* made files more generic, removed company's related terms
* added adcli and krb5-workstation packages for CentOS 7.x image
* added CentOS 7.4 Gen 2 template `hv_centos74_g2`
* removed `vlan_id` and `switch_name` settings - revert to default ones for repository to be more generic.
* fixed cmd scripts with Windows current catalog syntax.
* added CentOS 7.4 Gen 2 template `hv_centos74_g2`
* removed `vlan_id` and `switch_name` settings - revert to default ones for repository to be more generic.
* fixed cmd scripts with Windows current catalog syntax.
* added `cmd` scripts for Windows deployment
* initial build
