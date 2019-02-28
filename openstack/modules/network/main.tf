resource "openstack_networking_router_v2" "k8s" {
  name                = "${var.cluster_name}-router"
  admin_state_up      = "true"
  external_network_id = "${var.external_net}"
#  external_network_id = "${openstack_networking_network_v2.k8s.id}"
}


resource "openstack_networking_network_v2" "service-mesh-test" {
  name           = "service-mesh-test"
  shared              = "false"
  segments =[
    {
      segmentation_id = 2013,
      network_type = "vlan",
      physical_network = "phys_sriov0",
    }
  ],
  admin_state_up = "true"
}


#resource "openstack_networking_subnet_v2" "service-mesh-test-sub" {
#  name            = "service-mesh-test-internal-network"
#  network_id  = "${openstack_networking_network_v2.service-mesh-test.id}"
#  cidr            = "162.10.11.0/24"  # hardcoded need to be changed in both places, fixed ip
#  ip_version      = 4
#  dns_nameservers = "${var.dns_nameservers}"
#}


resource "openstack_networking_subnet_v2" "service-mesh-test-sub" {
  name            = "service-mesh-test-internal-network"
  network_id  = "${openstack_networking_network_v2.service-mesh-test.id}"
  cidr            = "10.40.213.0/24"  # hardcoded need to be changed in both places, fixed ip
  ip_version      = 4
  allocation_pools {
  start = "10.40.213.18"
  end   = "10.40.213.254"
  }
  dns_nameservers = "${var.dns_nameservers}"
}



resource "openstack_networking_network_v2" "k8s" {
  name           = "${var.network_name}"
  shared              = "false"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "k8s" {
  name            = "${var.cluster_name}-internal-network"
  network_id      = "${openstack_networking_network_v2.k8s.id}"
  cidr            = "${var.subnet_cidr}"
  ip_version      = 4
  dns_nameservers = "${var.dns_nameservers}"
}



resource "openstack_networking_network_v2" "ingress-net-test" {
  name           = "ingress-net-test"
  shared              = "false"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "ingress-net-test-sub" {
  name            = "ingress-net-test-sub-internal-network"
  network_id      = "${openstack_networking_network_v2.ingress-net-test.id}"
  cidr            = "162.10.12.0/24"  # hardcoded need to be changed in both places, fixed ip
  ip_version      = 4
  dns_nameservers = "${var.dns_nameservers}"
}

resource "openstack_networking_router_interface_v2" "k8s" {
  router_id = "${openstack_networking_router_v2.k8s.id}"
  subnet_id = "${openstack_networking_subnet_v2.k8s.id}"
# To Enable router interface to ServiceMesh/Ingress subnets uncomment below
#  subnet_id = "${openstack_networking_subnet_v2.service-mesh-test-sub.id}"

}
