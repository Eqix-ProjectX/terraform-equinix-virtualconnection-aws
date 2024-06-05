

resource "equinix_fabric_connection" "vd2aws" {
name = var.connection_name
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

