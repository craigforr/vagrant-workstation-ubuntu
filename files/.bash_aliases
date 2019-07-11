# alias azsub="az account list -o table | grep -E '$|.*True$'"
alias azsub="az account list --all --query 'sort_by([],&tenantId)|[].{Name:name,CloudName:cloudName,SubscriptionId:id,TenantId:tenantId,State:state,IsDefault:isDefault}' -o table | grep -E --color '^.*True.*|$'"
alias azd="az devops" # Manage Azure DevOps organization level operations
alias azp="az pipelines" # Manage Azure Pipelines
alias azr="az repos" # Manage Azure Repos
alias grep='grep --color=auto'
alias l='ls -1'
alias la='ll -a'
alias ll='ls -lF --color=never --time-style="+%Y-%m-%d %H:%M" --group-directories-first'
alias more='less -EFX'
