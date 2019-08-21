AZURE_CLI_CLIENT=$(grep client_id ~/.azure/credentials | cut -f2 -d'=')
AZURE_CLI_SECRET=$(grep secret ~/.azure/credentials | cut -f2 -d'=')
AZURE_CLI_TENANT=$(grep tenant ~/.azure/credentials | cut -f2 -d'=')

function az_login() {
  az login --service-principal -u $AZURE_CLI_CLIENT -p $AZURE_CLI_SECRET --tenant $AZURE_CLI_TENANT
}

# alias azsub="az account list -o table | grep -E '$|.*True$'"
alias azsub="az account list --all --query 'sort_by([],&tenantId)|[].{Name:name,CloudName:cloudName,SubscriptionId:id,TenantId:tenantId,State:state,IsDefault:isDefault}' -o table | grep -E --color '^.*True.*|$'"
alias azd="az devops" # Manage Azure DevOps organization level operations
alias azp="az pipelines" # Manage Azure Pipelines
alias azr="az repos" # Manage Azure Repos
alias grep='grep --color=auto'
alias l='ls -1 --color=never'
alias la='ll -a --color=never'
alias ll='ls -lF --color=never --time-style="+%Y-%m-%d %H:%M" --group-directories-first'
alias more='less -EFX'
alias tree='tree -n'
