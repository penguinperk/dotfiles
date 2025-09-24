# Alias
# ---
#
#
alias visource='vi ~/.zshrc'
alias sourceme='source ~/.zshrc'

#Misc
alias vim='mvim -v'
alias vi='mvim -v'
alias grep='grep --color'

#Apps
alias k="kubectl"
alias h="helm"
alias tf="terraform"
alias a="ansible"
alias ap="ansible-playbook"

alias code="open -a 'Visual Studio Code'"
alias cursor="open -a 'cursor'"

#Kubernetes
alias k='kubectl'
alias kn='kubectl config set-context --current --namespace'
alias kgp='kubectl get pods'
alias kl='kubectl logs'



alias prx="ssh root@prx-prod-2.home.clcreative.de"

#Azure
alias azlogin="az login --tenant lrsmanaged.com"
alias azlssub='az account list --query "[].{Name:name, Id:id, IsDefault:isDefault, State:state, Tenant:tenantId}" -o table'
alias azlsvm='az vm list -d --query "[].{Name:name, ResourceGroup:resourceGroup, Location:location, State:powerState}" -o table'
alias azsetsub='az account set --subscription $1'
alias azlsrg='az group list --output table'
alias azgetsub='az account show --query "{Name:name, SubscriptionId:id, IsDefault:isDefault}" -o table'
