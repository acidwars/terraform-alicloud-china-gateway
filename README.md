
# Module `.`

Provider Requirements:
* **alicloud:** (any version)

## Input Variables
* `cen_bandwidth` (required): The bandwidth in Mbps of the bandwidth package. Cannot be less than 2Mbps
* `cen_region_id` (required): The region ID of the child instance to attach
* `customer_gateway_europe` (required): IP of the local VPN Gateway
* `effect_immediately` (default `true`): Whether to delete a successfully negotiated IPsec tunnel and initiate a negotiation again.
* `ike_config` (required): The configurations of phase-one negotiation
* `instance_charge_type` (default `"PostPaid"`): VPN-GW charge type. Default PostPaid
* `ipsec_config` (required): The configurations of phase-two negotiation
* `local_subnet` (required): The CIDR block of the VPC to be connected with the local data center
* `region_china` (required): Select your region
* `region_europe` (required): Select your region
* `remote_subnet` (required): The CIDR block of the local data center. This parameter is used for phase-two negotiation.
* `route_entry_dest_cidrblock` (required): The destination CIDR block of the route entry to publish
* `route_table_id` (required): The route table of the attached VBR or VPC
* `vpc_id` (required): VPC where the Gateway should be deployed
* `vpc_route_table_id` (required): The route table of the attached VBR or VPC
* `vpn_bandwidth` (default `10`): VPN Bandwidth. Default 10

## Output Values
* `cen_bandwidth_package`
* `cen_instance`
* `cen_instance_attachment`
* `cen_route_entry`
* `route_entry`
* `vpn_connection`
* `vpn_customer_gateway`
* `vpn_gateway`

## Managed Resources
* `alicloud_cen_bandwidth_package.main` from `alicloud`
* `alicloud_cen_instance.main` from `alicloud`
* `alicloud_cen_instance_attachment.main` from `alicloud`
* `alicloud_cen_route_entry.main` from `alicloud`
* `alicloud_route_entry.main` from `alicloud`
* `alicloud_vpn_connection.main` from `alicloud`
* `alicloud_vpn_customer_gateway.main` from `alicloud`
* `alicloud_vpn_gateway.main` from `alicloud`

