export AZURE_CLIENT_ID=$(grep client_id ~/.azure/credentials | cut -f2 -d'=' | tr -d '\n' | tr -d '\r')
export AZURE_PASSWORD=$(grep secret ~/.azure/credentials | cut -f2 -d'=')
az login --service-principal -u http://$SP_NAME -p $pw --tenant $TENANT_ID
ansible-playbook aks-3-node-b1s.yml -e "environment=lab owner=jdoe"
az aks get-credentials -n $AKS_NAME -g $AKS_RESOURCE_GROUP
az group list --query '[?contains(name,`-rg`)].[name]'
tmux new-session -s ubu18
