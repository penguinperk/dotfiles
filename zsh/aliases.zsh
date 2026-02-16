# Alias
# ---
#
#
alias visource='vi ~/.zshrc'
alias vialias='vi ~/.config/dotfiles/zsh/aliases.zsh'
alias sourceme='source ~/.zshrc'

#Misc
alias vim='nvim'
alias vi='nvim'
alias grep='grep --color'
alias brewup='brew update && brew upgrade'
alias md='glow --style dark --pager --preserve-new-lines'
alias flushdns='sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder'

#Apps
alias k="kubectl"
alias h="helm"
alias a="ansible"
alias ap="ansible-playbook"

#Terraform
alias tf="terraform"
alias tfv="terraform validate"
alias tff="terraform fmt"
alias tfp="terraform plan"
alias tfa="terraform apply"


alias code="open -a 'Visual Studio Code'"
alias cursor="open -a 'cursor'"

#Kubernetes
alias k='kubectl'
alias kn='kubectl config set-context --current --namespace'
alias kgp='kubectl get pods'
alias kl='kubectl logs'

# Copilot
co-list() {
  echo "Custom Copilot CLI aliases/functions:"
  echo ""
  echo "1️⃣  co()       - Quick day-to-day CLI commands (gpt-5-mini)"
  echo "2️⃣  ico()      - Interactive / quick DevOps prompts (gpt-4.1-mini, --allow-all)"
  echo "3️⃣  co-code()  - Code-heavy tasks / Terraform / YAML (gpt-5.1-codex)"
  echo "4️⃣  co-heavy() - Deep architecture, SOC design, or large-scale reasoning (gpt-5)"
}

co() { copilot --model gpt-5-mini -p "$@"; }
ico() { copilot --model gpt-4.1-mini --allow-all "$@"; }
co-code() { copilot --model gpt-5.1-codex -p "$@"; }
co-heavy() { copilot --model gpt-5 -p "$@"; }



alias prx="ssh root@prx-prod-2.home.clcreative.de"

#Azure
alias azlstenant='az account show --query tenantId -o tsv'
alias azlogin="az login --tenant lrsmanaged.com"
alias azlssub='az account list --query "[].{Name:name, Id:id, IsDefault:isDefault, State:state, Tenant:tenantId}" -o table'
alias azlsvm='az vm list -d --query "[].{Name:name, ResourceGroup:resourceGroup, Location:location, State:powerState, PrivateIP:privateIps}" -o table'
alias azsetsub='az account set --subscription $1'
alias azlsrg='az group list --output table'
alias azgetsub='az account show --query "{Name:name, SubscriptionId:id, IsDefault:isDefault}" -o table'
alias azip-public='azip_public'
alias azip-private='azip_private'

#alias azfindloc="az account list-locations --query '[?contains(name, `centralus`)]' -o table"
#alias azgetvm="az vm get-instance-view --name ITS-MGMT-BF-DB2 --resource-group \$(az vm list --query \"[?name=='ITS-MGMT-BF-DB2'].resourceGroup\" -o tsv) --query \"instanceView.statuses[?starts_with(code, 'PowerState/')].displayStatus\" -o tsv"



#===================Funcations====================

azgetvm() {
    if [ -z "$1" ]; then
        echo "Usage: azgetvm <VM_NAME>"
        return 1
    fi

    local vmname="$1"
    local rg=$(az vm list --query "[?name=='$vmname'].resourceGroup" -o tsv)

    if [ -z "$rg" ]; then
        echo "VM '$vmname' not found in this subscription."
        return 1
    fi

    az vm get-instance-view \
        --name "$vmname" \
        --resource-group "$rg" \
        --query "instanceView.statuses[?starts_with(code, 'PowerState/')].displayStatus" \
        -o tsv
}

function azvmriv2() {
    local SUBSCRIPTION_ID
    SUBSCRIPTION_ID=$(az account show --query id -o tsv)

az vm list \
    --query "[].{
        ProductId: storageProfile.imageReference.publisher,
        SkuId: storageProfile.imageReference.sku,
        SubscriptionID: '$SUBSCRIPTION_ID',
        SkuTitle: hardwareProfile.vmSize,
        Region: location,
        VMName: name
    }" \
    --output table
}


# Function to check if an IP is a Public IP in Azure
function azip_public() {
    if [ -z "$1" ]; then
        echo "Usage: azip_public <IP_ADDRESS>"
        return 1
    fi
    az network public-ip list --query "[?ipAddress=='$1']" --output table
}

# Function to check if an IP is a Private IP in Azure NICs
function azip_private() {
    if [ -z "$1" ]; then
        echo "Usage: azip_private <IP_ADDRESS>"
        return 1
    fi
    az network nic list --query "[?ipConfigurations[?privateIpAddress=='$1']]" --output table
}

