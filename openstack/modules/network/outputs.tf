output "router_id" {
  value = "${openstack_networking_router_v2.k8s.id}"
}

output "router_internal_port_id" {
  value = "${openstack_networking_router_interface_v2.k8s.id}"
}

output "subnet_id" {
  value = "${openstack_networking_subnet_v2.k8s.id}"
}

output "sriov_id" {
  value  = "${openstack_networking_network_v2.service-mesh-test.id}"
}

output "sriov_subnet_id" {
  value  = "${openstack_networking_subnet_v2.service-mesh-test-sub.id}"
}

