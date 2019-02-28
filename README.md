# terraform-openstack-sriov

# Install Terraform in Ubuntu

  wget https://releases.hashicorp.com/terraform/0.11.11/terraform_0.11.11_linux_amd64.zip
  
  sudo apt-get install unzip
  
  unzip terraform_0.11.11_linux_amd64.zip
  
  sudo mv terraform /usr/bin/

# Install MacOS
  brew install terraform

# misc
MAKE SURE TO Source your 'clouds.yaml' or 'openrc.sh' file before running terraform commands, to connect to openstack
eg file : source openrc.sh


cd terraform-openstack-sriov
# INITIATE
  terraform init openstack/

# Kick off building cluster
  terraform apply -state=terraform.tfstate -var-file=cluster.tf openstack/

# Destroy all resources built
  terraform destroy -state=terraform.tfstate -var-file=cluster.tf openstack/

