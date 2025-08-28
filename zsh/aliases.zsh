# Alias
# ---
#
#
alias visource='vi ~/.zshrc'
alias sourceme='source ~/.zshrc'

alias k="kubectl"
alias h="helm"
alias tf="terraform"
alias a="ansible"
alias ap="ansible-playbook"

alias code="open -a 'Visual Studio Code'"
alias cursor="open -a 'cursor'"

alias gprj="cd $HOME/Projects"
alias gcs="cd $HOME/Projects/christianlempa/cheat-sheets"
alias gbp="cd $HOME/Projects/christianlempa/boilerplates"

#alias ls="exa --icons --group-directories-first"
#alias ll="exa --icons --group-directories-first -l"
alias grep='grep --color'

alias prx="ssh root@prx-prod-2.home.clcreative.de"

alias azll="az login --tenant lrsmanaged.com"
alias azlsub='az account list --query "[].{Name:name, Id:id, IsDefault:isDefault, State:state, Tenant:tenantId}" -o table'
alias azlvm='az vm list -d --query "[].{Name:name, ResourceGroup:resourceGroup, Location:location, State:powerState}" -o table'
alias azsetsub='az account set --subscription $1'
alias azlrg='az group list --output table'
alias azgetsub='az account show --query "{Name:name, SubscriptionId:id, IsDefault:isDefault}" -o table'
