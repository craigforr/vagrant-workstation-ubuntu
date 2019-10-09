# Vagrant Ubuntu Workstation

Ubuntu 18 Linux workstation for DevOps work.

## Roadmap

TODO:
- [ ] Add Google Cloud SDK tools for use with Google Cloud Platform.
- [ ] Add Vagrant definitions for Ansible test targets of differing OSes.

## Files

### Vagrantfile

### Environment Variables

The Vagrantfile contains a number of environment variables that should each contain files paths for each respective configuration file.  You can either create these environment variables locally or replace them with your paths directly in the Vagrant file.

Environment Variable Example:

```dosbatch
:: Windows Command
setx VAGRANT_WORKSTATION_ANSIBLE_VAULT_SECRET "C:/Users/Alice/.vault_password"
```

```bash
# Linux Command - Adds variable to .bashrc
echo 'export VAGRANT_WORKSTATION_ANSIBLE_VAULT_SECRET="/home/alice/.vault_password"' >> ~/.bashrc
```

Vagrantfile Example:

```ruby
# Change from:
workstation.vm.provision "file", source: "#{ENV['VAGRANT_WORKSTATION_ANSIBLE_VAULT_SECRET']}", destination: "/home/vagrant/.ansible/.vault_password"

# To your own path:
workstation.vm.provision "file", source: "C:/Users/Alice/.vault_password", destination: "/home/vagrant/.ansible/.vault_password"
```

If you do not require any of the tools represented by these configuration files, you can simply comment out the line by placing a hash (`#`) at the beginning of the relevant line:

```ruby
# Disable Ansible Vault secret provisioning
# workstation.vm.provision "file", source: "#{ENV['VAGRANT_WORKSTATION_ANSIBLE_VAULT_SECRET']}", destination: "/home/vagrant/.ansible/.vault_password"
```

#### `VAGRANT_WORKSTATION_ANSIBLE_VAULT_SECRET`

This is a text file containing the plain text of your [Ansible Vault][] password.

#### `VAGRANT_WORKSTATION_AWS_CREDENTIALS`

This is simply a standard [AWS credentials file][] for use with AWS CLI.

Example:

```cfg
# ~/.aws/credentials

[default]
aws_access_key_id = AKIAIOSFODNN7EXAMPLE
aws_secret_access_key = ...
aws_session_token = ...
```

#### `VAGRANT_WORKSTATION_AZURE_CREDENTIALS`

Azure credentials file for use with [Ansible][Ansible Azure Guide]

Example:

```cfg
[default]
subscription_id=xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
client_id=xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
secret=xxxxxxxxxxxxxxxxx
tenant=xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
```

#### `VAGRANT_WORKSTATION_AZURE_DEVOPS_TOKEN`

This is a single-line text file containing your Azure DevOps Personal Access Token (PAT), for use with the [Azure DevOps CLI][].

#### `VAGRANT_WORKSTATION_SHARED_DIR`

Local directory to share with the workstation VM.  This could be, for example, the path to your infrastructure-as-code deployment code repositories.

### Other Files

- `.bash_aliases` - Bash aliases and functions for convenience.
- `.bash_history` - Sample Bash history for persisting common or frequently used command lines across workstation deployments.
- `.git-prompt.sh` - Standard Git prompt customization.
- `.gitconfig` - Git configuration with aliases and other conveniences
- `.gitignore_global` - Basic [.gitignore][] file to apply to all repositories.
- `.tmux.conf` - Basic [tmux][] configuration file that tweaks the colors.
- `.vimrc` - Basic Vim configuration file with some relevant plugins and customizations for convenience.
- `azcopy_install.sh` - Script for installing [AzCopy for Linux][].
- `azure_config.ini` - Basic [Azure CLI configuration file][] for use with Azure CLI.

[Ansible Vault]: https://docs.ansible.com/ansible/latest/user_guide/vault.html
[AWS credentials file]: https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html
[Ansible Azure Guide]: https://docs.ansible.com/ansible/latest/scenario_guides/guide_azure.html
[Azure DevOps CLI]: https://docs.microsoft.com/en-us/azure/devops/cli/
[.gitignore]: https://git-scm.com/docs/gitignore
[tmux]: https://github.com/tmux/tmux#readme
[AzCopy for Linux]: https://docs.microsoft.com/en-us/azure/storage/common/storage-use-azcopy-v10
[Azure CLI configuration file]: https://docs.microsoft.com/en-us/cli/azure/azure-cli-configuration

<!-- EOF -->
