output "vpn_gateway" {
  value = alicloud_vpn_gateway.main
}
output "vpn_customer_gateway" {
  value = alicloud_vpn_customer_gateway.main
}
output "vpn_connection" {
  value = alicloud_vpn_connection.main
}
output "cen_instance" {
  value = alicloud_cen_instance.main
}
output "cen_instance_attachment" {
  value = alicloud_cen_instance_attachment.main
}
output "route_entry" {
  value = alicloud_route_entry.main
}
output "cen_route_entry" {
  value = alicloud_cen_route_entry.main
}
output "cen_bandwidth_package" {
  value = alicloud_cen_bandwidth_package.main
}

