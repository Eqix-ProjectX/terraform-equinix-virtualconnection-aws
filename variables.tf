
############# Primary Connection Variables #################

variable "equinix_client_id" {
  description = "Equinix client ID (consumer key), obtained after registering app in the developer platform"
  type        = string
}
variable "equinix_client_secret" {
  description = "Equinix client secret ID (consumer secret), obtained after registering app in the developer platform"
  type        = string
}

variable "connection_name" {
  description = "Connection name. An alpha-numeric 24 characters string which can include only hyphens and underscores"
  type        = string
}
variable "connection_type" {
  description = "Defines the connection type like VG_VC, EVPL_VC, EPL_VC, EC_VC, IP_VC, ACCESS_EPL_VC"
  type        = string
}

variable "notifications_emails" {
  description = "Array of contact emails"
  type        = list(string)
}
variable "bandwidth" {
  description = "Connection bandwidth in Mbps"
  type        = number
}
variable "purchase_order_number" {
  description = "Purchase order number"
  type        = string
}

variable "device_uuid" {
  description = "Device UUID"
  type        = string
}

variable "interface_number" {
  description = "Device Interface"
  type        = string
}
variable "authentication_key" {
  description = "AWS ID"
  type        = string
}
variable "profile_uuid" {
  description = "AWS profile UUID"
  type        = string
}
variable "metro" {
  description = "Metro"
  type        = string
}

variable "seller_region" {
  description = "Seller Region"
  type        = string
}

############# AWS Variables #################


variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "aws_access_key" {
  description = "AWS Access Key"
  type        = string
}


variable "aws_secret_key" {
  description = "AWS Secret Key"
  type        = string
}

variable "aws_token" {
  description = "AWS Token"
  type        = string
}

variable "aws_vpc_name" {
  description = "AWS VPC CIDR"
  type        = string
}


variable "aws_vpc_cidr" {
  description = "AWS VPC CIDR"
  type        = string
}

variable "aws_subnet_name" {
  description = "AWS Subnet name"
  type        = string
}


variable "aws_subnet_cidr" {
  description = "AWS Subnet CIDR"
  type        = string
}

variable "aws_vpg_name" {
  description = "AWS VPG name"
  type        = string
}


variable "aws_vif_name" {
  description = "AWS Subnet Availability zone"
  type        = string
}

variable "customer_asn" {
  description = "NE ASN"
  type        = string
}

variable "aws_bgp_auth_key" {
  description = "AWS BGP key"
  type        = string
}

variable "amazon_ip_address" {
  description = "AWS IP"
  type        = string
}

variable "customer_ip_address" {
  description = "Customer NE interface IP"
  type        = string
}

