variable "region_europe" {
  description = "Select your region"
}
variable "region_china" {
  description = "Select your region"
}
variable "vpc_id" {
  description = "VPC where the Gateway should be deployed"
  type        = string
}
variable "instance_charge_type" {
  description = "VPN-GW charge type. Default PostPaid"
  default     = "PostPaid"
}
variable "vpn_bandwidth" {
  description = "VPN Bandwidth. Default 10"
  default     = 10
  type        = number
}
variable "customer_gateway_europe" {
  description = "IP of the local VPN Gateway"
  type        = string
}
variable "local_subnet" {
  description = "The CIDR block of the VPC to be connected with the local data center"
  type        = list
}
variable "remote_subnet" {
  description = "The CIDR block of the local data center. This parameter is used for phase-two negotiation."
  type        = list
}
variable "effect_immediately" {
  description = "Whether to delete a successfully negotiated IPsec tunnel and initiate a negotiation again."
  type        = bool
  default     = true
}
variable "ike_config" {
  description = "The configurations of phase-one negotiation"
}
variable "ipsec_config" {
  description = "The configurations of phase-two negotiation"
}
variable "cen_region_id" {
  description = "The region ID of the child instance to attach"
  type        = string
}
variable "vpc_route_table_id" {
  description = "The route table of the attached VBR or VPC"
  type        = string
}
variable "route_entry_dest_cidrblock" {
  description = "The destination CIDR block of the route entry to publish"
  type        = string
}
variable "cen_bandwidth" {
  description = "The bandwidth in Mbps of the bandwidth package. Cannot be less than 2Mbps"
  type        = number
}

