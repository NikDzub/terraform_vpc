### Architecture diagram 
![Screen Shot 2024-01-21 at 2 15 39](https://github.com/NikDzub/terraform_vpc/assets/87159434/f3713c48-3c7e-4804-a708-1eb7ea9b7c68)
![Screen Shot 2024-01-17 at 21 51 22](https://github.com/NikDzub/terraform_vpc/assets/87159434/0e8f4aa1-967c-46bd-9d19-e7b7d31ddb74)
```bash
cd environments/development
```
```bash
terraform init && terraform apply -auto-approve
```
### Notes
1. ELB v2/RDS/Auto Scaling is supported by LocalStack only in the pro version.
so I commented those modules to apply w/o any errors.
### State
```json
{
  "version": 4,
  "terraform_version": "1.6.6",
  "serial": 162,
  "lineage": "b524760a-a5d8-88ae-5872-d75b638a4efe",
  "outputs": {},
  "resources": [
    {
      "module": "module.route_53",
      "mode": "managed",
      "type": "aws_route53_record",
      "name": "app_record",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 2,
          "attributes": {
            "alias": [
              {
                "evaluate_target_health": true,
                "name": "test",
                "zone_id": "tets"
              }
            ],
            "allow_overwrite": null,
            "cidr_routing_policy": [],
            "failover_routing_policy": [],
            "fqdn": "www.example.com",
            "geolocation_routing_policy": [],
            "health_check_id": "",
            "id": "PECY5E4BS80Q2FR_www.example.com_A",
            "latency_routing_policy": [],
            "multivalue_answer_routing_policy": false,
            "name": "www.example.com",
            "records": [],
            "set_identifier": "",
            "ttl": 0,
            "type": "A",
            "weighted_routing_policy": [],
            "zone_id": "PECY5E4BS80Q2FR"
          },
          "sensitive_attributes": [],
          "private": "eyJzY2hlbWFfdmVyc2lvbiI6IjIifQ==",
          "dependencies": [
            "module.route_53.aws_route53_zone.app_zone",
            "module.vpc.aws_vpc.main"
          ]
        }
      ]
    },
    {
      "module": "module.route_53",
      "mode": "managed",
      "type": "aws_route53_zone",
      "name": "app_zone",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "arn": "arn:aws:route53:::hostedzone/PECY5E4BS80Q2FR",
            "comment": "Managed by Terraform",
            "delegation_set_id": "",
            "force_destroy": false,
            "id": "PECY5E4BS80Q2FR",
            "name": "example.com",
            "name_servers": [
              "ns-2048.awsdns-64.com",
              "ns-2049.awsdns-65.net",
              "ns-2050.awsdns-66.org",
              "ns-2051.awsdns-67.co.uk"
            ],
            "primary_name_server": "ns-2048.awsdns-64.com",
            "tags": {
              "Name": "dev_route53_zone"
            },
            "tags_all": {
              "Name": "dev_route53_zone"
            },
            "vpc": [
              {
                "vpc_id": "vpc-2980b810",
                "vpc_region": "us-east-1"
              }
            ],
            "zone_id": "PECY5E4BS80Q2FR"
          },
          "sensitive_attributes": [],
          "private": "bnVsbA==",
          "dependencies": [
            "module.vpc.aws_vpc.main"
          ]
        }
      ]
    },
    {
      "module": "module.s3",
      "mode": "managed",
      "type": "aws_s3_bucket",
      "name": "chum_bucket",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "acceleration_status": "",
            "acl": null,
            "arn": "arn:aws:s3:::chum",
            "bucket": "chum",
            "bucket_domain_name": "chum.s3.amazonaws.com",
            "bucket_prefix": "",
            "bucket_regional_domain_name": "chum.s3.us-east-1.amazonaws.com",
            "cors_rule": [],
            "force_destroy": false,
            "grant": [
              {
                "id": "75aa57f09aa0c8caeab4f8c24e99d10f8e7faeebf76c078efc7c6caea54ba06a",
                "permissions": [
                  "FULL_CONTROL"
                ],
                "type": "CanonicalUser",
                "uri": ""
              }
            ],
            "hosted_zone_id": "Z3AQBSTGFYJSTF",
            "id": "chum",
            "lifecycle_rule": [],
            "logging": [],
            "object_lock_configuration": [],
            "object_lock_enabled": false,
            "policy": "",
            "region": "us-east-1",
            "replication_configuration": [],
            "request_payer": "BucketOwner",
            "server_side_encryption_configuration": [
              {
                "rule": [
                  {
                    "apply_server_side_encryption_by_default": [
                      {
                        "kms_master_key_id": "",
                        "sse_algorithm": "AES256"
                      }
                    ],
                    "bucket_key_enabled": false
                  }
                ]
              }
            ],
            "tags": {
              "Name": "dev_chum_bucket"
            },
            "tags_all": {
              "Name": "dev_chum_bucket"
            },
            "timeouts": null,
            "versioning": [
              {
                "enabled": false,
                "mfa_delete": false
              }
            ],
            "website": [],
            "website_domain": null,
            "website_endpoint": null
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxMjAwMDAwMDAwMDAwLCJkZWxldGUiOjM2MDAwMDAwMDAwMDAsInJlYWQiOjEyMDAwMDAwMDAwMDAsInVwZGF0ZSI6MTIwMDAwMDAwMDAwMH19"
        }
      ]
    },
    {
      "module": "module.s3",
      "mode": "managed",
      "type": "aws_s3_bucket_acl",
      "name": "chum_bucket_acl",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "access_control_policy": [
              {
                "grant": [
                  {
                    "grantee": [
                      {
                        "display_name": "webfile",
                        "email_address": "",
                        "id": "75aa57f09aa0c8caeab4f8c24e99d10f8e7faeebf76c078efc7c6caea54ba06a",
                        "type": "CanonicalUser",
                        "uri": ""
                      }
                    ],
                    "permission": "FULL_CONTROL"
                  }
                ],
                "owner": [
                  {
                    "display_name": "webfile",
                    "id": "75aa57f09aa0c8caeab4f8c24e99d10f8e7faeebf76c078efc7c6caea54ba06a"
                  }
                ]
              }
            ],
            "acl": "private",
            "bucket": "chum",
            "expected_bucket_owner": "",
            "id": "chum,private"
          },
          "sensitive_attributes": [],
          "private": "bnVsbA==",
          "dependencies": [
            "module.s3.aws_s3_bucket.chum_bucket"
          ]
        }
      ]
    },
    {
      "module": "module.security_group",
      "mode": "managed",
      "type": "aws_security_group",
      "name": "alb_sg",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 1,
          "attributes": {
            "arn": "arn:aws:ec2:us-east-1:000000000000:security-group/sg-8f126418f6f2a5909",
            "description": "http/https access on port 80/443",
            "egress": [
              {
                "cidr_blocks": [
                  "0.0.0.0/0"
                ],
                "description": "",
                "from_port": 0,
                "ipv6_cidr_blocks": [],
                "prefix_list_ids": [],
                "protocol": "-1",
                "security_groups": [],
                "self": false,
                "to_port": 0
              }
            ],
            "id": "sg-8f126418f6f2a5909",
            "ingress": [
              {
                "cidr_blocks": [
                  "0.0.0.0/0"
                ],
                "description": "http",
                "from_port": 80,
                "ipv6_cidr_blocks": [],
                "prefix_list_ids": [],
                "protocol": "tcp",
                "security_groups": [],
                "self": false,
                "to_port": 80
              },
              {
                "cidr_blocks": [
                  "0.0.0.0/0"
                ],
                "description": "https",
                "from_port": 443,
                "ipv6_cidr_blocks": [],
                "prefix_list_ids": [],
                "protocol": "tcp",
                "security_groups": [],
                "self": false,
                "to_port": 443
              }
            ],
            "name": "alb_sg",
            "name_prefix": "",
            "owner_id": "000000000000",
            "revoke_rules_on_delete": false,
            "tags": {
              "Name": "dev_alb_sg"
            },
            "tags_all": {
              "Name": "dev_alb_sg"
            },
            "timeouts": null,
            "vpc_id": "vpc-2980b810"
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6OTAwMDAwMDAwMDAwfSwic2NoZW1hX3ZlcnNpb24iOiIxIn0=",
          "dependencies": [
            "module.vpc.aws_vpc.main"
          ]
        }
      ]
    },
    {
      "module": "module.security_group",
      "mode": "managed",
      "type": "aws_security_group",
      "name": "db_sg",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 1,
          "attributes": {
            "arn": "arn:aws:ec2:us-east-1:000000000000:security-group/sg-3307e4c76ed1da606",
            "description": "mysql access on port 3306 from webserver",
            "egress": [],
            "id": "sg-3307e4c76ed1da606",
            "ingress": [
              {
                "cidr_blocks": [],
                "description": "",
                "from_port": 3306,
                "ipv6_cidr_blocks": [],
                "prefix_list_ids": [],
                "protocol": "tcp",
                "security_groups": [
                  "sg-924d0a03d9ba8b810"
                ],
                "self": false,
                "to_port": 3306
              }
            ],
            "name": "db_sg",
            "name_prefix": "",
            "owner_id": "000000000000",
            "revoke_rules_on_delete": false,
            "tags": {},
            "tags_all": {},
            "timeouts": null,
            "vpc_id": "vpc-2980b810"
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6OTAwMDAwMDAwMDAwfSwic2NoZW1hX3ZlcnNpb24iOiIxIn0=",
          "dependencies": [
            "module.security_group.aws_security_group.alb_sg",
            "module.security_group.aws_security_group.ssh_sg",
            "module.security_group.aws_security_group.web_server_sg",
            "module.vpc.aws_vpc.main"
          ]
        }
      ]
    },
    {
      "module": "module.security_group",
      "mode": "managed",
      "type": "aws_security_group",
      "name": "ssh_sg",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 1,
          "attributes": {
            "arn": "arn:aws:ec2:us-east-1:000000000000:security-group/sg-195fa49470af76249",
            "description": "ssh access on port 22",
            "egress": [],
            "id": "sg-195fa49470af76249",
            "ingress": [
              {
                "cidr_blocks": [
                  "0.0.0.0/32"
                ],
                "description": "ssh",
                "from_port": 22,
                "ipv6_cidr_blocks": [],
                "prefix_list_ids": [],
                "protocol": "tcp",
                "security_groups": [],
                "self": false,
                "to_port": 22
              }
            ],
            "name": "ssh_sg",
            "name_prefix": "",
            "owner_id": "000000000000",
            "revoke_rules_on_delete": false,
            "tags": {},
            "tags_all": {},
            "timeouts": null,
            "vpc_id": "vpc-2980b810"
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6OTAwMDAwMDAwMDAwfSwic2NoZW1hX3ZlcnNpb24iOiIxIn0=",
          "dependencies": [
            "module.vpc.aws_vpc.main"
          ]
        }
      ]
    },
    {
      "module": "module.security_group",
      "mode": "managed",
      "type": "aws_security_group",
      "name": "web_server_sg",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 1,
          "attributes": {
            "arn": "arn:aws:ec2:us-east-1:000000000000:security-group/sg-924d0a03d9ba8b810",
            "description": "http/https/ssh access on port 80/443/22",
            "egress": [
              {
                "cidr_blocks": [
                  "0.0.0.0/0"
                ],
                "description": "",
                "from_port": 0,
                "ipv6_cidr_blocks": [],
                "prefix_list_ids": [],
                "protocol": "-1",
                "security_groups": [],
                "self": false,
                "to_port": 0
              }
            ],
            "id": "sg-924d0a03d9ba8b810",
            "ingress": [
              {
                "cidr_blocks": [],
                "description": "web_server_sg_http",
                "from_port": 80,
                "ipv6_cidr_blocks": [],
                "prefix_list_ids": [],
                "protocol": "tcp",
                "security_groups": [
                  "sg-8f126418f6f2a5909"
                ],
                "self": false,
                "to_port": 80
              },
              {
                "cidr_blocks": [],
                "description": "web_server_sg_https",
                "from_port": 443,
                "ipv6_cidr_blocks": [],
                "prefix_list_ids": [],
                "protocol": "tcp",
                "security_groups": [
                  "sg-8f126418f6f2a5909"
                ],
                "self": false,
                "to_port": 443
              },
              {
                "cidr_blocks": [],
                "description": "web_server_sg_ssh",
                "from_port": 22,
                "ipv6_cidr_blocks": [],
                "prefix_list_ids": [],
                "protocol": "tcp",
                "security_groups": [
                  "sg-195fa49470af76249"
                ],
                "self": false,
                "to_port": 22
              }
            ],
            "name": "web_server_sg",
            "name_prefix": "",
            "owner_id": "000000000000",
            "revoke_rules_on_delete": false,
            "tags": {},
            "tags_all": {},
            "timeouts": null,
            "vpc_id": "vpc-2980b810"
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6OTAwMDAwMDAwMDAwfSwic2NoZW1hX3ZlcnNpb24iOiIxIn0=",
          "dependencies": [
            "module.security_group.aws_security_group.alb_sg",
            "module.security_group.aws_security_group.ssh_sg",
            "module.vpc.aws_vpc.main"
          ]
        }
      ]
    },
    {
      "module": "module.subnet",
      "mode": "managed",
      "type": "aws_eip",
      "name": "eip4_nat_gw_az1",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "address": null,
            "allocation_id": "eipalloc-1805c3ef",
            "associate_with_private_ip": null,
            "association_id": "eipassoc-33e8b345",
            "carrier_ip": "",
            "customer_owned_ip": "",
            "customer_owned_ipv4_pool": "",
            "domain": "vpc",
            "id": "eipalloc-1805c3ef",
            "instance": "",
            "network_border_group": "",
            "network_interface": "eni-83323269",
            "private_dns": "ip-10-146-1-4.ec2.internal",
            "private_ip": "10.146.1.4",
            "public_dns": "ec2-127-211-95-191.compute-1.amazonaws.com",
            "public_ip": "127.211.95.191",
            "public_ipv4_pool": "",
            "tags": {
              "Name": "eip4_nat_gw_az1"
            },
            "tags_all": {
              "Name": "eip4_nat_gw_az1"
            },
            "timeouts": null,
            "vpc": true
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiZGVsZXRlIjoxODAwMDAwMDAwMDAsInJlYWQiOjkwMDAwMDAwMDAwMCwidXBkYXRlIjozMDAwMDAwMDAwMDB9fQ=="
        }
      ]
    },
    {
      "module": "module.subnet",
      "mode": "managed",
      "type": "aws_eip",
      "name": "eip4_nat_gw_az2",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "address": null,
            "allocation_id": "eipalloc-22d1901b",
            "associate_with_private_ip": null,
            "association_id": "eipassoc-6e849801",
            "carrier_ip": "",
            "customer_owned_ip": "",
            "customer_owned_ipv4_pool": "",
            "domain": "vpc",
            "id": "eipalloc-22d1901b",
            "instance": "",
            "network_border_group": "",
            "network_interface": "eni-2d41dde2",
            "private_dns": "ip-10-146-205-137.ec2.internal",
            "private_ip": "10.146.205.137",
            "public_dns": "ec2-127-87-133-109.compute-1.amazonaws.com",
            "public_ip": "127.87.133.109",
            "public_ipv4_pool": "",
            "tags": {
              "Name": "eip4_nat_gw_az2"
            },
            "tags_all": {
              "Name": "eip4_nat_gw_az2"
            },
            "timeouts": null,
            "vpc": true
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiZGVsZXRlIjoxODAwMDAwMDAwMDAsInJlYWQiOjkwMDAwMDAwMDAwMCwidXBkYXRlIjozMDAwMDAwMDAwMDB9fQ=="
        }
      ]
    },
    {
      "module": "module.subnet",
      "mode": "managed",
      "type": "aws_nat_gateway",
      "name": "nat_gw_az1",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "allocation_id": "eipalloc-1805c3ef",
            "association_id": "eipassoc-33e8b345",
            "connectivity_type": "public",
            "id": "nat-8985725a66bf63464",
            "network_interface_id": "eni-83323269",
            "private_ip": "10.146.1.4",
            "public_ip": "127.211.95.191",
            "secondary_allocation_ids": [],
            "secondary_private_ip_address_count": 0,
            "secondary_private_ip_addresses": [],
            "subnet_id": "subnet-26a80fb6",
            "tags": {
              "Name": "nat_gw_az_1"
            },
            "tags_all": {
              "Name": "nat_gw_az_1"
            },
            "timeouts": null
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6MTgwMDAwMDAwMDAwMCwidXBkYXRlIjo2MDAwMDAwMDAwMDB9fQ==",
          "dependencies": [
            "module.subnet.aws_eip.eip4_nat_gw_az1",
            "module.subnet.aws_subnet.public_sub_az1",
            "module.vpc.aws_internet_gateway.igw",
            "module.vpc.aws_vpc.main"
          ]
        }
      ]
    },
    {
      "module": "module.subnet",
      "mode": "managed",
      "type": "aws_nat_gateway",
      "name": "nat_gw_az2",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "allocation_id": "eipalloc-22d1901b",
            "association_id": "eipassoc-6e849801",
            "connectivity_type": "public",
            "id": "nat-8102d978d1bf82223",
            "network_interface_id": "eni-2d41dde2",
            "private_ip": "10.146.205.137",
            "public_ip": "127.87.133.109",
            "secondary_allocation_ids": [],
            "secondary_private_ip_address_count": 0,
            "secondary_private_ip_addresses": [],
            "subnet_id": "subnet-af995044",
            "tags": {
              "Name": "nat_gw_az_2"
            },
            "tags_all": {
              "Name": "nat_gw_az_2"
            },
            "timeouts": null
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6MTgwMDAwMDAwMDAwMCwidXBkYXRlIjo2MDAwMDAwMDAwMDB9fQ==",
          "dependencies": [
            "module.subnet.aws_eip.eip4_nat_gw_az2",
            "module.subnet.aws_subnet.public_sub_az2",
            "module.vpc.aws_internet_gateway.igw",
            "module.vpc.aws_vpc.main"
          ]
        }
      ]
    },
    {
      "module": "module.subnet",
      "mode": "managed",
      "type": "aws_route_table_association",
      "name": "priv_app_az1",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "gateway_id": "",
            "id": "rtbassoc-0dde98e7",
            "route_table_id": "rtb-57e627f6",
            "subnet_id": "subnet-38a0ebdb",
            "timeouts": null
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjozMDAwMDAwMDAwMDAsImRlbGV0ZSI6MzAwMDAwMDAwMDAwLCJ1cGRhdGUiOjEyMDAwMDAwMDAwMH19",
          "dependencies": [
            "module.subnet.aws_subnet.private_app_sub_az1",
            "module.vpc.aws_route_table.priv_rt",
            "module.vpc.aws_vpc.main"
          ]
        }
      ]
    },
    {
      "module": "module.subnet",
      "mode": "managed",
      "type": "aws_route_table_association",
      "name": "priv_app_az2",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "gateway_id": "",
            "id": "rtbassoc-72d70344",
            "route_table_id": "rtb-57e627f6",
            "subnet_id": "subnet-e52a3cb7",
            "timeouts": null
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjozMDAwMDAwMDAwMDAsImRlbGV0ZSI6MzAwMDAwMDAwMDAwLCJ1cGRhdGUiOjEyMDAwMDAwMDAwMH19",
          "dependencies": [
            "module.subnet.aws_subnet.private_app_sub_az2",
            "module.vpc.aws_route_table.priv_rt",
            "module.vpc.aws_vpc.main"
          ]
        }
      ]
    },
    {
      "module": "module.subnet",
      "mode": "managed",
      "type": "aws_route_table_association",
      "name": "priv_data_az1",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "gateway_id": "",
            "id": "rtbassoc-761523d1",
            "route_table_id": "rtb-57e627f6",
            "subnet_id": "subnet-3a0b6012",
            "timeouts": null
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjozMDAwMDAwMDAwMDAsImRlbGV0ZSI6MzAwMDAwMDAwMDAwLCJ1cGRhdGUiOjEyMDAwMDAwMDAwMH19",
          "dependencies": [
            "module.subnet.aws_subnet.private_data_sub_az1",
            "module.vpc.aws_route_table.priv_rt",
            "module.vpc.aws_vpc.main"
          ]
        }
      ]
    },
    {
      "module": "module.subnet",
      "mode": "managed",
      "type": "aws_route_table_association",
      "name": "priv_data_az2",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "gateway_id": "",
            "id": "rtbassoc-9fd7afd3",
            "route_table_id": "rtb-57e627f6",
            "subnet_id": "subnet-b9c8a584",
            "timeouts": null
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjozMDAwMDAwMDAwMDAsImRlbGV0ZSI6MzAwMDAwMDAwMDAwLCJ1cGRhdGUiOjEyMDAwMDAwMDAwMH19",
          "dependencies": [
            "module.subnet.aws_subnet.private_data_sub_az2",
            "module.vpc.aws_route_table.priv_rt",
            "module.vpc.aws_vpc.main"
          ]
        }
      ]
    },
    {
      "module": "module.subnet",
      "mode": "managed",
      "type": "aws_route_table_association",
      "name": "public_az1",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "gateway_id": "",
            "id": "rtbassoc-c38ad473",
            "route_table_id": "rtb-5a7e3c22",
            "subnet_id": "subnet-26a80fb6",
            "timeouts": null
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjozMDAwMDAwMDAwMDAsImRlbGV0ZSI6MzAwMDAwMDAwMDAwLCJ1cGRhdGUiOjEyMDAwMDAwMDAwMH19",
          "dependencies": [
            "module.subnet.aws_subnet.public_sub_az1",
            "module.vpc.aws_internet_gateway.igw",
            "module.vpc.aws_route_table.pub_rt",
            "module.vpc.aws_vpc.main"
          ]
        }
      ]
    },
    {
      "module": "module.subnet",
      "mode": "managed",
      "type": "aws_route_table_association",
      "name": "public_az2",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "gateway_id": "",
            "id": "rtbassoc-4239492b",
            "route_table_id": "rtb-5a7e3c22",
            "subnet_id": "subnet-af995044",
            "timeouts": null
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjozMDAwMDAwMDAwMDAsImRlbGV0ZSI6MzAwMDAwMDAwMDAwLCJ1cGRhdGUiOjEyMDAwMDAwMDAwMH19",
          "dependencies": [
            "module.subnet.aws_subnet.public_sub_az2",
            "module.vpc.aws_internet_gateway.igw",
            "module.vpc.aws_route_table.pub_rt",
            "module.vpc.aws_vpc.main"
          ]
        }
      ]
    },
    {
      "module": "module.subnet",
      "mode": "managed",
      "type": "aws_subnet",
      "name": "private_app_sub_az1",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 1,
          "attributes": {
            "arn": "arn:aws:ec2:us-east-1:000000000000:subnet/subnet-38a0ebdb",
            "assign_ipv6_address_on_creation": false,
            "availability_zone": "us-east-1b",
            "availability_zone_id": "use1-az1",
            "cidr_block": "10.0.100.0/24",
            "customer_owned_ipv4_pool": "",
            "enable_dns64": false,
            "enable_lni_at_device_index": 0,
            "enable_resource_name_dns_a_record_on_launch": false,
            "enable_resource_name_dns_aaaa_record_on_launch": false,
            "id": "subnet-38a0ebdb",
            "ipv6_cidr_block": "",
            "ipv6_cidr_block_association_id": "",
            "ipv6_native": false,
            "map_customer_owned_ip_on_launch": false,
            "map_public_ip_on_launch": false,
            "outpost_arn": "",
            "owner_id": "000000000000",
            "private_dns_hostname_type_on_launch": "ip-name",
            "tags": {
              "Name": "dev_private_app_sub_az1"
            },
            "tags_all": {
              "Name": "dev_private_app_sub_az1"
            },
            "timeouts": null,
            "vpc_id": "vpc-2980b810"
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6MTIwMDAwMDAwMDAwMH0sInNjaGVtYV92ZXJzaW9uIjoiMSJ9",
          "dependencies": [
            "module.vpc.aws_vpc.main"
          ]
        }
      ]
    },
    {
      "module": "module.subnet",
      "mode": "managed",
      "type": "aws_subnet",
      "name": "private_app_sub_az2",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 1,
          "attributes": {
            "arn": "arn:aws:ec2:us-east-1:000000000000:subnet/subnet-e52a3cb7",
            "assign_ipv6_address_on_creation": false,
            "availability_zone": "us-east-1c",
            "availability_zone_id": "use1-az2",
            "cidr_block": "10.0.103.0/24",
            "customer_owned_ipv4_pool": "",
            "enable_dns64": false,
            "enable_lni_at_device_index": 0,
            "enable_resource_name_dns_a_record_on_launch": false,
            "enable_resource_name_dns_aaaa_record_on_launch": false,
            "id": "subnet-e52a3cb7",
            "ipv6_cidr_block": "",
            "ipv6_cidr_block_association_id": "",
            "ipv6_native": false,
            "map_customer_owned_ip_on_launch": false,
            "map_public_ip_on_launch": false,
            "outpost_arn": "",
            "owner_id": "000000000000",
            "private_dns_hostname_type_on_launch": "ip-name",
            "tags": {
              "Name": "dev_private_app_sub_az2"
            },
            "tags_all": {
              "Name": "dev_private_app_sub_az2"
            },
            "timeouts": null,
            "vpc_id": "vpc-2980b810"
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6MTIwMDAwMDAwMDAwMH0sInNjaGVtYV92ZXJzaW9uIjoiMSJ9",
          "dependencies": [
            "module.vpc.aws_vpc.main"
          ]
        }
      ]
    },
    {
      "module": "module.subnet",
      "mode": "managed",
      "type": "aws_subnet",
      "name": "private_data_sub_az1",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 1,
          "attributes": {
            "arn": "arn:aws:ec2:us-east-1:000000000000:subnet/subnet-3a0b6012",
            "assign_ipv6_address_on_creation": false,
            "availability_zone": "us-east-1b",
            "availability_zone_id": "use1-az1",
            "cidr_block": "10.0.102.0/24",
            "customer_owned_ipv4_pool": "",
            "enable_dns64": false,
            "enable_lni_at_device_index": 0,
            "enable_resource_name_dns_a_record_on_launch": false,
            "enable_resource_name_dns_aaaa_record_on_launch": false,
            "id": "subnet-3a0b6012",
            "ipv6_cidr_block": "",
            "ipv6_cidr_block_association_id": "",
            "ipv6_native": false,
            "map_customer_owned_ip_on_launch": false,
            "map_public_ip_on_launch": false,
            "outpost_arn": "",
            "owner_id": "000000000000",
            "private_dns_hostname_type_on_launch": "ip-name",
            "tags": {
              "Name": "dev_private_data_sub_az1"
            },
            "tags_all": {
              "Name": "dev_private_data_sub_az1"
            },
            "timeouts": null,
            "vpc_id": "vpc-2980b810"
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6MTIwMDAwMDAwMDAwMH0sInNjaGVtYV92ZXJzaW9uIjoiMSJ9",
          "dependencies": [
            "module.vpc.aws_vpc.main"
          ]
        }
      ]
    },
    {
      "module": "module.subnet",
      "mode": "managed",
      "type": "aws_subnet",
      "name": "private_data_sub_az2",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 1,
          "attributes": {
            "arn": "arn:aws:ec2:us-east-1:000000000000:subnet/subnet-b9c8a584",
            "assign_ipv6_address_on_creation": false,
            "availability_zone": "us-east-1c",
            "availability_zone_id": "use1-az2",
            "cidr_block": "10.0.104.0/24",
            "customer_owned_ipv4_pool": "",
            "enable_dns64": false,
            "enable_lni_at_device_index": 0,
            "enable_resource_name_dns_a_record_on_launch": false,
            "enable_resource_name_dns_aaaa_record_on_launch": false,
            "id": "subnet-b9c8a584",
            "ipv6_cidr_block": "",
            "ipv6_cidr_block_association_id": "",
            "ipv6_native": false,
            "map_customer_owned_ip_on_launch": false,
            "map_public_ip_on_launch": false,
            "outpost_arn": "",
            "owner_id": "000000000000",
            "private_dns_hostname_type_on_launch": "ip-name",
            "tags": {
              "Name": "dev_private_data_sub_az2"
            },
            "tags_all": {
              "Name": "dev_private_data_sub_az2"
            },
            "timeouts": null,
            "vpc_id": "vpc-2980b810"
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6MTIwMDAwMDAwMDAwMH0sInNjaGVtYV92ZXJzaW9uIjoiMSJ9",
          "dependencies": [
            "module.vpc.aws_vpc.main"
          ]
        }
      ]
    },
    {
      "module": "module.subnet",
      "mode": "managed",
      "type": "aws_subnet",
      "name": "public_sub_az1",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 1,
          "attributes": {
            "arn": "arn:aws:ec2:us-east-1:000000000000:subnet/subnet-26a80fb6",
            "assign_ipv6_address_on_creation": false,
            "availability_zone": "us-east-1b",
            "availability_zone_id": "use1-az1",
            "cidr_block": "10.0.1.0/24",
            "customer_owned_ipv4_pool": "",
            "enable_dns64": false,
            "enable_lni_at_device_index": 0,
            "enable_resource_name_dns_a_record_on_launch": false,
            "enable_resource_name_dns_aaaa_record_on_launch": false,
            "id": "subnet-26a80fb6",
            "ipv6_cidr_block": "",
            "ipv6_cidr_block_association_id": "",
            "ipv6_native": false,
            "map_customer_owned_ip_on_launch": false,
            "map_public_ip_on_launch": false,
            "outpost_arn": "",
            "owner_id": "000000000000",
            "private_dns_hostname_type_on_launch": "ip-name",
            "tags": {
              "Name": "dev_public_sub_az1"
            },
            "tags_all": {
              "Name": "dev_public_sub_az1"
            },
            "timeouts": null,
            "vpc_id": "vpc-2980b810"
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6MTIwMDAwMDAwMDAwMH0sInNjaGVtYV92ZXJzaW9uIjoiMSJ9",
          "dependencies": [
            "module.vpc.aws_vpc.main"
          ]
        }
      ]
    },
    {
      "module": "module.subnet",
      "mode": "managed",
      "type": "aws_subnet",
      "name": "public_sub_az2",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 1,
          "attributes": {
            "arn": "arn:aws:ec2:us-east-1:000000000000:subnet/subnet-af995044",
            "assign_ipv6_address_on_creation": false,
            "availability_zone": "us-east-1c",
            "availability_zone_id": "use1-az2",
            "cidr_block": "10.0.2.0/24",
            "customer_owned_ipv4_pool": "",
            "enable_dns64": false,
            "enable_lni_at_device_index": 0,
            "enable_resource_name_dns_a_record_on_launch": false,
            "enable_resource_name_dns_aaaa_record_on_launch": false,
            "id": "subnet-af995044",
            "ipv6_cidr_block": "",
            "ipv6_cidr_block_association_id": "",
            "ipv6_native": false,
            "map_customer_owned_ip_on_launch": false,
            "map_public_ip_on_launch": false,
            "outpost_arn": "",
            "owner_id": "000000000000",
            "private_dns_hostname_type_on_launch": "ip-name",
            "tags": {
              "Name": "dev_public_sub_az2"
            },
            "tags_all": {
              "Name": "dev_public_sub_az2"
            },
            "timeouts": null,
            "vpc_id": "vpc-2980b810"
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6MTIwMDAwMDAwMDAwMH0sInNjaGVtYV92ZXJzaW9uIjoiMSJ9",
          "dependencies": [
            "module.vpc.aws_vpc.main"
          ]
        }
      ]
    },
    {
      "module": "module.vpc",
      "mode": "managed",
      "type": "aws_internet_gateway",
      "name": "igw",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "arn": "arn:aws:ec2:us-east-1:000000000000:internet-gateway/igw-f01c8aa2",
            "id": "igw-f01c8aa2",
            "owner_id": "000000000000",
            "tags": {
              "Name": "dev_internet_gateway"
            },
            "tags_all": {
              "Name": "dev_internet_gateway"
            },
            "timeouts": null,
            "vpc_id": "vpc-2980b810"
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxMjAwMDAwMDAwMDAwLCJkZWxldGUiOjEyMDAwMDAwMDAwMDAsInVwZGF0ZSI6MTIwMDAwMDAwMDAwMH19",
          "dependencies": [
            "module.vpc.aws_vpc.main"
          ]
        }
      ]
    },
    {
      "module": "module.vpc",
      "mode": "managed",
      "type": "aws_route_table",
      "name": "priv_rt",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "arn": "arn:aws:ec2:us-east-1:000000000000:route-table/rtb-57e627f6",
            "id": "rtb-57e627f6",
            "owner_id": "000000000000",
            "propagating_vgws": [],
            "route": [],
            "tags": {
              "Name": "dev_priv_rt"
            },
            "tags_all": {
              "Name": "dev_priv_rt"
            },
            "timeouts": null,
            "vpc_id": "vpc-2980b810"
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjozMDAwMDAwMDAwMDAsImRlbGV0ZSI6MzAwMDAwMDAwMDAwLCJ1cGRhdGUiOjEyMDAwMDAwMDAwMH19",
          "dependencies": [
            "module.vpc.aws_vpc.main"
          ]
        }
      ]
    },
    {
      "module": "module.vpc",
      "mode": "managed",
      "type": "aws_route_table",
      "name": "pub_rt",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "arn": "arn:aws:ec2:us-east-1:000000000000:route-table/rtb-5a7e3c22",
            "id": "rtb-5a7e3c22",
            "owner_id": "000000000000",
            "propagating_vgws": [],
            "route": [
              {
                "carrier_gateway_id": "",
                "cidr_block": "0.0.0.0/0",
                "core_network_arn": "",
                "destination_prefix_list_id": "",
                "egress_only_gateway_id": "",
                "gateway_id": "igw-f01c8aa2",
                "ipv6_cidr_block": "",
                "local_gateway_id": "",
                "nat_gateway_id": "",
                "network_interface_id": "",
                "transit_gateway_id": "",
                "vpc_endpoint_id": "",
                "vpc_peering_connection_id": ""
              }
            ],
            "tags": {
              "Name": "dev_pub_rt"
            },
            "tags_all": {
              "Name": "dev_pub_rt"
            },
            "timeouts": null,
            "vpc_id": "vpc-2980b810"
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjozMDAwMDAwMDAwMDAsImRlbGV0ZSI6MzAwMDAwMDAwMDAwLCJ1cGRhdGUiOjEyMDAwMDAwMDAwMH19",
          "dependencies": [
            "module.vpc.aws_internet_gateway.igw",
            "module.vpc.aws_vpc.main"
          ]
        }
      ]
    },
    {
      "module": "module.vpc",
      "mode": "managed",
      "type": "aws_vpc",
      "name": "main",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 1,
          "attributes": {
            "arn": "arn:aws:ec2:us-east-1:000000000000:vpc/vpc-2980b810",
            "assign_generated_ipv6_cidr_block": false,
            "cidr_block": "10.0.0.0/16",
            "default_network_acl_id": "acl-55e1c476",
            "default_route_table_id": "rtb-8db5cdca",
            "default_security_group_id": "sg-c6092b31334eaab37",
            "dhcp_options_id": "default",
            "enable_dns_hostnames": true,
            "enable_dns_support": true,
            "enable_network_address_usage_metrics": false,
            "id": "vpc-2980b810",
            "instance_tenancy": "default",
            "ipv4_ipam_pool_id": null,
            "ipv4_netmask_length": null,
            "ipv6_association_id": "",
            "ipv6_cidr_block": "",
            "ipv6_cidr_block_network_border_group": "",
            "ipv6_ipam_pool_id": "",
            "ipv6_netmask_length": 0,
            "main_route_table_id": "rtb-8db5cdca",
            "owner_id": "000000000000",
            "tags": {
              "Name": "dev_vpc"
            },
            "tags_all": {
              "Name": "dev_vpc"
            }
          },
          "sensitive_attributes": [],
          "private": "eyJzY2hlbWFfdmVyc2lvbiI6IjEifQ=="
        }
      ]
    },
    {
      "module": "module.web_server",
      "mode": "data",
      "type": "aws_ami",
      "name": "latest_amazon_linux",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "architecture": "x86_64",
            "arn": "arn:aws:ec2:us-east-1::image/ami-04681a1dbd79675a5",
            "block_device_mappings": [
              {
                "device_name": "/dev/xvda",
                "ebs": {
                  "delete_on_termination": "false",
                  "encrypted": "false",
                  "iops": "0",
                  "snapshot_id": "snap-bbca3f5f",
                  "throughput": "0",
                  "volume_size": "15",
                  "volume_type": "standard"
                },
                "no_device": "",
                "virtual_name": ""
              }
            ],
            "boot_mode": "",
            "creation_date": "2024-01-17T16:53:03.000Z",
            "deprecation_time": "",
            "description": "Amazon Linux 2 AMI 2.0.20180810 x86_64 HVM gp2",
            "ena_support": false,
            "executable_users": null,
            "filter": [
              {
                "name": "name",
                "values": [
                  "amzn2-ami-*-gp2"
                ]
              },
              {
                "name": "virtualization-type",
                "values": [
                  "hvm"
                ]
              }
            ],
            "hypervisor": "xen",
            "id": "ami-04681a1dbd79675a5",
            "image_id": "ami-04681a1dbd79675a5",
            "image_location": "amazon/amzn2-ami-hvm-2.0.20180810-x86_64-gp2",
            "image_owner_alias": "amazon",
            "image_type": "machine",
            "imds_support": "",
            "include_deprecated": false,
            "kernel_id": "None",
            "most_recent": true,
            "name": "amzn2-ami-hvm-2.0.20180810-x86_64-gp2",
            "name_regex": null,
            "owner_id": "137112412989",
            "owners": [
              "amazon"
            ],
            "platform": "Linux/UNIX",
            "platform_details": "",
            "product_codes": [],
            "public": true,
            "ramdisk_id": "ari-1a2b3c4d",
            "root_device_name": "/dev/xvda",
            "root_device_type": "ebs",
            "root_snapshot_id": "snap-bbca3f5f",
            "sriov_net_support": "",
            "state": "available",
            "state_reason": {
              "code": "UNSET",
              "message": "UNSET"
            },
            "tags": {},
            "timeouts": null,
            "tpm_support": "",
            "usage_operation": "",
            "virtualization_type": "hvm"
          },
          "sensitive_attributes": []
        }
      ]
    },
    {
      "module": "module.web_server",
      "mode": "managed",
      "type": "aws_instance",
      "name": "web_server",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "index_key": 0,
          "schema_version": 1,
          "attributes": {
            "ami": "ami-04681a1dbd79675a5",
            "arn": "arn:aws:ec2:us-east-1::instance/i-b3dcd2d957508a04d",
            "associate_public_ip_address": true,
            "availability_zone": "us-east-1b",
            "capacity_reservation_specification": [],
            "cpu_core_count": null,
            "cpu_options": [],
            "cpu_threads_per_core": null,
            "credit_specification": [],
            "disable_api_stop": false,
            "disable_api_termination": false,
            "ebs_block_device": [],
            "ebs_optimized": false,
            "enclave_options": [],
            "ephemeral_block_device": [],
            "get_password_data": false,
            "hibernation": false,
            "host_id": "",
            "host_resource_group_arn": null,
            "iam_instance_profile": "",
            "id": "i-b3dcd2d957508a04d",
            "instance_initiated_shutdown_behavior": "stop",
            "instance_lifecycle": "",
            "instance_market_options": [],
            "instance_state": "running",
            "instance_type": "t2.micro",
            "ipv6_address_count": 0,
            "ipv6_addresses": [],
            "key_name": "dev_server_key",
            "launch_template": [],
            "maintenance_options": [],
            "metadata_options": [],
            "monitoring": false,
            "network_interface": [],
            "outpost_arn": "",
            "password_data": "",
            "placement_group": "",
            "placement_partition_number": 0,
            "primary_network_interface_id": "eni-bf8298a6",
            "private_dns": "ip-10-0-1-5.ec2.internal",
            "private_dns_name_options": [],
            "private_ip": "10.0.1.5",
            "public_dns": "ec2-54-214-182-140.compute-1.amazonaws.com",
            "public_ip": "54.214.182.140",
            "root_block_device": [
              {
                "delete_on_termination": true,
                "device_name": "/dev/sda1",
                "encrypted": false,
                "iops": 0,
                "kms_key_id": "",
                "tags": {},
                "throughput": 0,
                "volume_id": "vol-59286277",
                "volume_size": 8,
                "volume_type": "gp2"
              }
            ],
            "secondary_private_ips": [],
            "security_groups": [],
            "source_dest_check": true,
            "spot_instance_request_id": "",
            "subnet_id": "subnet-26a80fb6",
            "tags": {
              "Name": "dev_web_server_server_az1"
            },
            "tags_all": {
              "Name": "dev_web_server_server_az1"
            },
            "tenancy": "default",
            "timeouts": null,
            "user_data": "8502713c8fecd550bdf3bb726383ef3bc1734ad5",
            "user_data_base64": null,
            "user_data_replace_on_change": false,
            "volume_tags": null,
            "vpc_security_group_ids": [
              "sg-8f126418f6f2a5909",
              "sg-924d0a03d9ba8b810"
            ]
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6MTIwMDAwMDAwMDAwMCwidXBkYXRlIjo2MDAwMDAwMDAwMDB9LCJzY2hlbWFfdmVyc2lvbiI6IjEifQ==",
          "dependencies": [
            "module.security_group.aws_security_group.alb_sg",
            "module.security_group.aws_security_group.ssh_sg",
            "module.security_group.aws_security_group.web_server_sg",
            "module.subnet.aws_subnet.public_sub_az1",
            "module.subnet.aws_subnet.public_sub_az2",
            "module.vpc.aws_vpc.main",
            "module.web_server.aws_key_pair.web_server",
            "module.web_server.aws_launch_template.web_server_template",
            "module.web_server.data.aws_ami.latest_amazon_linux"
          ]
        },
        {
          "index_key": 1,
          "schema_version": 1,
          "attributes": {
            "ami": "ami-04681a1dbd79675a5",
            "arn": "arn:aws:ec2:us-east-1::instance/i-84de0feb2d1c669ff",
            "associate_public_ip_address": true,
            "availability_zone": "us-east-1c",
            "capacity_reservation_specification": [],
            "cpu_core_count": null,
            "cpu_options": [],
            "cpu_threads_per_core": null,
            "credit_specification": [],
            "disable_api_stop": false,
            "disable_api_termination": false,
            "ebs_block_device": [],
            "ebs_optimized": false,
            "enclave_options": [],
            "ephemeral_block_device": [],
            "get_password_data": false,
            "hibernation": false,
            "host_id": "",
            "host_resource_group_arn": null,
            "iam_instance_profile": "",
            "id": "i-84de0feb2d1c669ff",
            "instance_initiated_shutdown_behavior": "stop",
            "instance_lifecycle": "",
            "instance_market_options": [],
            "instance_state": "running",
            "instance_type": "t2.micro",
            "ipv6_address_count": 0,
            "ipv6_addresses": [],
            "key_name": "dev_server_key",
            "launch_template": [],
            "maintenance_options": [],
            "metadata_options": [],
            "monitoring": false,
            "network_interface": [],
            "outpost_arn": "",
            "password_data": "",
            "placement_group": "",
            "placement_partition_number": 0,
            "primary_network_interface_id": "eni-9e147cdb",
            "private_dns": "ip-10-0-2-5.ec2.internal",
            "private_dns_name_options": [],
            "private_ip": "10.0.2.5",
            "public_dns": "ec2-54-214-225-161.compute-1.amazonaws.com",
            "public_ip": "54.214.225.161",
            "root_block_device": [
              {
                "delete_on_termination": true,
                "device_name": "/dev/sda1",
                "encrypted": false,
                "iops": 0,
                "kms_key_id": "",
                "tags": {},
                "throughput": 0,
                "volume_id": "vol-fff060d7",
                "volume_size": 8,
                "volume_type": "gp2"
              }
            ],
            "secondary_private_ips": [],
            "security_groups": [],
            "source_dest_check": true,
            "spot_instance_request_id": "",
            "subnet_id": "subnet-af995044",
            "tags": {
              "Name": "dev_web_server_server_az1"
            },
            "tags_all": {
              "Name": "dev_web_server_server_az1"
            },
            "tenancy": "default",
            "timeouts": null,
            "user_data": "8502713c8fecd550bdf3bb726383ef3bc1734ad5",
            "user_data_base64": null,
            "user_data_replace_on_change": false,
            "volume_tags": null,
            "vpc_security_group_ids": [
              "sg-8f126418f6f2a5909",
              "sg-924d0a03d9ba8b810"
            ]
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6MTIwMDAwMDAwMDAwMCwidXBkYXRlIjo2MDAwMDAwMDAwMDB9LCJzY2hlbWFfdmVyc2lvbiI6IjEifQ==",
          "dependencies": [
            "module.security_group.aws_security_group.alb_sg",
            "module.security_group.aws_security_group.ssh_sg",
            "module.security_group.aws_security_group.web_server_sg",
            "module.subnet.aws_subnet.public_sub_az1",
            "module.subnet.aws_subnet.public_sub_az2",
            "module.vpc.aws_vpc.main",
            "module.web_server.aws_key_pair.web_server",
            "module.web_server.aws_launch_template.web_server_template",
            "module.web_server.data.aws_ami.latest_amazon_linux"
          ]
        }
      ]
    },
    {
      "module": "module.web_server",
      "mode": "managed",
      "type": "aws_key_pair",
      "name": "web_server",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 1,
          "attributes": {
            "arn": "arn:aws:ec2:us-east-1::key-pair/dev_server_key",
            "fingerprint": "4c:0d:4b:56:85:83:4a:aa:37:12:6f:18:5d:db:7d:d6",
            "id": "dev_server_key",
            "key_name": "dev_server_key",
            "key_name_prefix": "",
            "key_pair_id": "key-4ebfe877",
            "key_type": "",
            "public_key": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCT4qYKFEMqrVQc2hiZhEWghA0sp/my8JtLaIbA+pxZxz/E6Unvy+fBYEv2pUva5z5cCKo0fc2zJpaoGB0l9D4AUbT4Ke/t9yAl7eoptb8e9nEpdj3Iv7wY0PsuocsK5WMWTFIZqH3D+JOJF33jdr6b8PVbzVC9PPnDhzO8kyKxoAjTb1//SQnSX2d1XmYO2LliH1K+wcNevm5CmJl7MTcWW9iv1JRqOlNz2CjdfUj9XiWcgoeoDsUfss0hXOs2ZCcTX+bp5lscwTX27vdXO4zo69S/GfY+Ozze1xgcFsjDt2OlfdvzItLXLblKhmYgohG0vdftqHfgzppI8EsFy55WKt2Q4Htkg97S/XvcgS9AZJRVUAw03BGltDFDDDowiENfJJ/TYpdVDfLzAyAOINeOzKNVbkrNQWnAA+TFwYIjZ9i9B5ivkafrSc961T31OahXY0FgMdk12R4Hr6ectL0wkZKQBAdrRGey0SMufF7zAvarCrm51Hi0bQ/zijqIFZ0= ihpt@ihpts-MacBook-Air.local",
            "tags": {},
            "tags_all": {}
          },
          "sensitive_attributes": [],
          "private": "eyJzY2hlbWFfdmVyc2lvbiI6IjEifQ=="
        }
      ]
    },
    {
      "module": "module.web_server",
      "mode": "managed",
      "type": "aws_launch_template",
      "name": "web_server_template",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "arn": "arn:aws:ec2:us-east-1::launch-template/lt-e0947e881b2a0eef7",
            "block_device_mappings": [],
            "capacity_reservation_specification": [],
            "cpu_options": [],
            "credit_specification": [],
            "default_version": 1,
            "description": "",
            "disable_api_stop": false,
            "disable_api_termination": false,
            "ebs_optimized": "",
            "elastic_gpu_specifications": [],
            "elastic_inference_accelerator": [],
            "enclave_options": [],
            "hibernation_options": [],
            "iam_instance_profile": [],
            "id": "lt-e0947e881b2a0eef7",
            "image_id": "ami-04681a1dbd79675a5",
            "instance_initiated_shutdown_behavior": "",
            "instance_market_options": [],
            "instance_requirements": [],
            "instance_type": "t2.micro",
            "kernel_id": "",
            "key_name": "dev_server_key",
            "latest_version": 1,
            "license_specification": [],
            "maintenance_options": [],
            "metadata_options": [],
            "monitoring": [],
            "name": "web-server-template",
            "name_prefix": "",
            "network_interfaces": [],
            "placement": [],
            "private_dns_name_options": [],
            "ram_disk_id": "",
            "security_group_names": [],
            "tag_specifications": [],
            "tags": {},
            "tags_all": {},
            "update_default_version": null,
            "user_data": "#!bin/bash\nsudo yum update -y \u0026\u0026 sudo yum install -y docker\nsudo systemctl start docker\nsudo usermod -aG docker ec2-user\ndocker run -p 8080:80 nginx",
            "vpc_security_group_ids": [
              "sg-8f126418f6f2a5909",
              "sg-924d0a03d9ba8b810"
            ]
          },
          "sensitive_attributes": [],
          "private": "bnVsbA==",
          "dependencies": [
            "module.security_group.aws_security_group.alb_sg",
            "module.security_group.aws_security_group.ssh_sg",
            "module.security_group.aws_security_group.web_server_sg",
            "module.vpc.aws_vpc.main",
            "module.web_server.aws_key_pair.web_server",
            "module.web_server.data.aws_ami.latest_amazon_linux"
          ]
        }
      ]
    }
  ],
  "check_results": null
}

```
