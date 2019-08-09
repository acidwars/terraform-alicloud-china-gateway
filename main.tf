provider "alicloud" {
  alias  = "europe"
  region = var.region_europe
}
provider "alicloud" {
  alias  = "china"
  region = var.china_region
}
resource "alicloud_vpn_gateway" "main" {
  provider             = alicloud.europe
  name                 = "vpn_gateway_europe"
  vpc_id               = var.vpc_id
  instance_charge_type = var.instance_charge_type
  bandwidth            = var.vpn_bandwidth
  enable_ipsec         = true
  description          = "VPN Instance built with Terraform at ${timestamp()}"
}
resource "alicloud_vpn_customer_gateway" "main" {
  provider   = alicloud.europe
  name       = "customer_gateway_europe"
  ip_address = var.customer_gw_ip
}
resource "alicloud_vpn_connection" "main" {
  provider            = alicloud.europe
  name                = "vpn_connection_europe"
  vpn_gateway_id      = alicloud_vpn_gateway.main.id
  customer_gateway_id = alicloud_vpn_customer_gateway.main.id
  local_subnet        = var.local_subnet
  remote_subnet       = var.remote_subnet
  effect_immediately  = var.effect_immediately
  ike_config          = var.ike_config
  ipsec_config        = var.ipsec_config
}
resource "alicloud_cen_instance" "main" {
  provider    = europe
  name        = "cen_instance_tf"
  description = "CEN Instance built with Terraform at ${timestamp()}"
}
resource "alicloud_cen_instance_attachment" "main" {
  provider                 = alicloud.europe
  instance_id              = alicloud_cen_instance.main.id
  child_instance_id        = var.vpc_id
  child_instance_region_id = var.cen_region_id
}
resource "alicloud_route_entry" "route" {
  provider              = alicloud.china
  route_table_id        = alicloud_vpc.vpc.route_table_id
  destination_cidrblock = var.route_entry_dest_cidrblock
  nexthop_type          = "Instance"
  nexthop_id            = "${alicloud_instance.default.id}"
}
resource "alicloud_cen_route_entry" "main" {
  provider       = alicloud.china
  instance_id    = alicloud_cen_instance.main.id
  route_table_id = var.vpc_route_table_id
  cidr_block     = alicloud_route_entry.route.destination_cidrblock
  depends_on = [
    alicloud_cen_instance_attachment.main
  ]
}
resource "alicloud_cen_bandwidth_package" "main" {
  bandwidth = var.cen_bandwidth_package
  geographic_region_ids = [
    "Europe",
    "China"
  ]
  description = "Terraformed at ${timestamp()}"
}
