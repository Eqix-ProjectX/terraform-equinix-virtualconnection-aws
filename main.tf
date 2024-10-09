resource "random_pet" "this" {
  length = 2
}

resource "equinix_fabric_connection" "vd2aws" {
  name = "${var.connection_name}${random_pet.this.id }"
  type = var.connection_type
  notifications {
    type   = "ALL"
    emails = var.notifications_emails
  }
  bandwidth = var.bandwidth
  order {
    purchase_order_number = var.purchase_order_number
  }
  a_side {
    access_point {
      type = "VD"
      virtual_device {
        type = "EDGE"
        uuid = var.device_uuid
      }
      interface {
        type = "CLOUD"
        id = var.interface_number
      }
    }
  }

    z_side {
    access_point {
      type = "SP"
      authentication_key = var.authentication_key
      seller_region = var.seller_region
      profile {
        type = "L2_PROFILE"
        uuid = var.profile_uuid
      }
      location {
        metro_code = var.metro
      }
    }
  }
}

locals {
    provider_connection_ids = [
    for access_point in [
      for z in equinix_fabric_connection.vd2aws.z_side : tolist(z.access_point)[0]
    ] : access_point.provider_connection_id
  ]  
}

resource "aws_dx_connection_confirmation" "aws_dx_connection_confirm" {
  connection_id = local.provider_connection_ids[0]
  
}

data "aws_dx_connection" "dx_connection" {
  depends_on = [ equinix_fabric_connection.vd2aws ]
  name = "${var.connection_name}${random_pet.this.id }"
}


resource "aws_vpc" "main" {
  cidr_block = var.aws_vpc_cidr
  tags = {
    Name = var.aws_vpc_name
  }
}

resource "aws_subnet" "private" {
  depends_on = [aws_vpc.main ]
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.aws_subnet_cidr
   tags = {
    Name = var.aws_subnet_name
  }
}

resource "aws_vpn_gateway" "vgw" {
   depends_on = [aws_subnet.private ]
  vpc_id = aws_vpc.main.id
tags = {
    Name = var.aws_vpg_name
  }
  
}

resource "aws_dx_private_virtual_interface" "aws_dx_vif" {
  depends_on = [aws_dx_connection_confirmation.aws_dx_connection_confirm ]
  connection_id    = local.provider_connection_ids[0] 
  name             = var.aws_vif_name
  vlan             = data.aws_dx_connection.dx_connection.vlan_id
  address_family   = "ipv4"
  bgp_asn          = var.customer_asn
  bgp_auth_key     = var.aws_bgp_auth_key
  amazon_address   = var.amazon_ip_address
  customer_address = var.customer_ip_address
  mtu              = 1500
  vpn_gateway_id   = aws_vpn_gateway.vgw.id
} 
