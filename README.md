# terraform-equinix-virtualconnection-aws

Module to create VC to AWS from an NE device.

A sample terraform.tfvars file is provided, change the values in it and run the code.

```terraform
connection_name       = "AWS-VC"
connection_type       = "EVPL_VC"
notifications_emails  = ["test@ap.equinix.com"]
bandwidth             = 50
purchase_order_number = "1-323292"
device_uuid           = "d50e9f23-5056-4da8-8d9c-47b32dd8613a"
interface_number      = 17
authentication_key    = "97123424768"
profile_uuid          = "69ee618d-be52-468d-bc99-00566f2dd2b9"
metro                 = "SG"
seller_region         = "ap-southeast-1"


aws_region = "us-east-1"
aws_vpc_name    = "AWS_VPC"
aws_vpc_cidr    = "10.0.0.0/16"
aws_subnet_name = "AWS_SUBNET"
aws_subnet_cidr = "10.0.0.0/20"
aws_vpg_name = "AWS_VPG"
aws_vif_name        = "AWS_VIF"
customer_asn        = 65100
aws_bgp_auth_key    = "testbgp"
amazon_ip_address   = "192.168.1.2/30"
customer_ip_address = "192.168.1.1/30"
```

>[!note]
>Declare your credential as environment variables before you run.  
>`export EQUINIX_API_CLIENTID=someEquinixAPIClientID`  
>`export EQUINIX_API_CLIENTSECRET=someEquinixAPIClientSecret`  
>`export METAL_AUTH_TOKEN=someEquinixMetalToken`
>
> AWS access key can be same way. refer https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html?icmpid=docs_sso_user_portal