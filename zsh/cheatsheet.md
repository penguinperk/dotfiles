# ZSH Aliases & Functions Cheatsheet

*Auto-generated from aliases.zsh*

## Alias

- `visource` → `vi ~/.zshrc`
- `vialias` → `vi ~/.config/dotfiles/zsh/aliases.zsh`
- `sourceme` → `source ~/.zshrc`
- `readcheat` → `md ~/.config/dotfiles/zsh/cheatsheet.md`
## Directories

- `goco` → `cd /Users/e3339/Documents/src/copilot`
- `setco` → `/Users/e3339/Documents/src/copilot/copy-git-files.sh`
## Misc

- `vim` → `nvim`
- `vi` → `nvim`
- `grep` → `grep --color`
- `brewup` → `brew update && brew upgrade`
- `md` → `glow --style dark --pager --preserve-new-lines`
- `flushdns` → `sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder`
## Apps

- `k` → `kubectl`
- `h` → `helm`
- `a` → `ansible`
- `ap` → `ansible-playbook`
## Terraform

- `tf` → `terraform`
- `tfv` → `terraform validate`
- `tff` → `terraform fmt`
- `tfp` → `terraform plan`
- `tfa` → `terraform apply`
- `code` → `open -a 'Visual Studio Code'`
- `cursor` → `open -a 'cursor'`
## Kubernetes

- `k` → `kubectl`
- `kn` → `kubectl config set-context --current --namespace`
- `kgp` → `kubectl get pods`
- `kl` → `kubectl logs`
## Copilot

- `co-list()` - *function*
- `co()` - *function*
- `coi()` - *function*
- `co-code()` - *function*
- `co-heavy()` - *function*
- `prx` → `ssh root@prx-prod-2.home.clcreative.de`
## Azure

- `azlstenant` → `az account show --query tenantId -o tsv`
- `azlogin` → `az login --tenant lrsmanaged.com`
- `azlssub` → `az account list --query "[].{Name:name, Id:id, IsDefault:isDefault, State:state, Tenant:tenantId}" -o table`
- `azlsvm` → `az vm list -d --query "[].{Name:name, ResourceGroup:resourceGroup, Location:location, State:powerState, PrivateIP:privateIps}" -o table`
- `azsetsub` → `az account set --subscription $1`
- `azlsrg` → `az group list --output table`
- `azgetsub` → `az account show --query "{Name:name, SubscriptionId:id, IsDefault:isDefault}" -o table`
- `azip-public` → `azip_public`
- `azip-private` → `azip_private`
## alias azfindloc="az account list-locations --query '[?contains(name, `centralus`)]' -o table"

## alias azgetvm="az vm get-instance-view --name ITS-MGMT-BF-DB2 --resource-group \$(az vm list --query \"[?name=='ITS-MGMT-BF-DB2'].resourceGroup\" -o tsv) --query \"instanceView.statuses[?starts_with(code, 'PowerState/')].displayStatus\" -o tsv"

- `azgetvm()` - *function*
- `function azvmriv2()` - *function*
- `az vm list \()` - *function*
## Function to check if an IP is a Public IP in Azure

- `function azip_public()` - *function*
## Function to check if an IP is a Private IP in Azure NICs

- `function azip_private()` - *function*
- `get-cheat()` - *function*
## Cheatsheet

- `cheat` → `/Users/e3339/.config/dotfiles/zsh/generate-cheatsheet.zsh && md ~/.config/dotfiles/zsh/cheatsheet.md`

## Quick Reference

### Most Used Commands
- `k` → kubectl
- `tf` → terraform
- `vim/vi` → nvim
- `co` → copilot (quick commands)
- `sourceme` → reload zsh config

### Copilot Functions
- `co()` - Quick day-to-day CLI commands (gpt-5-mini)
- `coi()` - Interactive / quick DevOps prompts (gpt-4.1-mini, --allow-all)
- `co-code()` - Code-heavy tasks / Terraform / YAML (gpt-5.1-codex)
- `co-heavy()` - Deep architecture, SOC design, or large-scale reasoning (gpt-5)
- `co-list()` - Show copilot function descriptions

### Azure Functions
- `azgetvm <VM_NAME>` - Get VM power state
- `azvmriv2()` - List VMs with detailed info
- `azip_public <IP>` - Check if IP is Azure public IP
- `azip_private <IP>` - Check if IP is Azure private IP

---
*Generated on: Wed Mar  4 11:44:56 CST 2026*
