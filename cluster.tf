# your Kubernetes cluster name here
cluster_name = "mgm-test"

# SSH key to use for access to nodes
public_key_path = "~/.ssh/devosp.pub"

# image to use for bastion, masters, standalone etcd instances, and nodes
image = "ubuntu1804"
# user on the node (ex. core on Container Linux, ubuntu on Ubuntu, etc.)
ssh_user = "ubuntu"

# 0|1 bastion nodes
number_of_bastions = 1
flavor_bastion = 7

# standalone etcds
number_of_etcd = 0

# masters
number_of_k8s_masters = 1
number_of_k8s_masters_no_etcd = 0
number_of_k8s_masters_no_floating_ip = 2
number_of_k8s_masters_no_floating_ip_no_etcd = 0
flavor_k8s_master = 9

# nodes
number_of_k8s_nodes = 0
number_of_k8s_nodes_no_floating_ip = 3
flavor_k8s_node = 8

# GlusterFS
# either 0 or more than one
number_of_gfs_nodes_no_floating_ip = 0
gfs_volume_size_in_gb = 50
# Container Linux does not support GlusterFS
image_gfs = "ubuntu1804"
# May be different from other nodes
ssh_user_gfs = "ubuntu"
flavor_gfs_node = "7"







# Router
#UID OF Public network already existing
external_net = "2bd75c3b-c737-4cad-8bf9-4e58c9ead742"
#Above one is public net

# networking
network_name = "kube-network-test"
subnet_cidr = "162.10.10.0/24"
floatingip_pool = "public"
bastion_allowed_remote_ips = ["0.0.0.0/0"]
