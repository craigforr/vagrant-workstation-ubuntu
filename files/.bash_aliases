# export AZURE_CLIENT_ID=$(awk -F "=" '/client_id/ {print $2}' ~/.azure/credentials)
# export AZURE_SECRET=$(awk -F "=" '/secret/ {print $2}' ~/.azure/credentials)
# export AZURE_SUBSCRIPTION_ID=$(awk -F "=" '/subscription_id/ {print $2}' ~/.azure/credentials)
# export AZURE_TENANT=$(awk -F "=" '/tenant/ {print $2}' ~/.azure/credentials)

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

# function azlogin() {
# # Logs in with Azure CLI using Environment Variables
#   az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_SECRET --tenant $AZURE_TENANT
# }

function findami() {
# Searches for an AWS AMI by ID and Region
  REGION_DEFAULT='us-east-1'
  if [[ "$1"x = 'x' ]] ; then
    echo "Please specify an AMI ID."
  else
    if [[ "$2"x = 'x' ]] ; then
      REGION="$2"
    else
      REGION="$REGION_DEFAULT"
    fi
    aws ec2 describe-images \
        --image-id $AMI_ID \
        --query "Images[*].Description[]" \
        --output text \
        --region $REGION
  fi
}
