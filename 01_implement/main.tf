resource "aws_resourcegroups_group" "network_demo" {
  name        = "rg-network_demo"
  description = "Resource group for network demo resources"

  resource_query {
    query = <<JSON
    {
      "ResourceTypeFilters": [
        "AWS::AllSupported"
      ],
      "TagFilters": [
        {
          "Key": "Owner",
          "Values": ["John Ajera"]
        }
      ]
    }
    JSON
  }

  tags = {
    Name  = "rg-network_demo"
    Owner = "John Ajera"
  }
}

data "aws_ami" "alpine" {
  most_recent = true

  filter {
    name   = "name"
    values = ["alpine-3.15.10-x86_64-bios-cloudinit-r0"]
  }
}

data "aws_ami" "fedora-coreos" {
  most_recent = true

  filter {
    name   = "name"
    values = ["fedora-coreos-38.20230514.3.0-x86_64"]
  }
}

data "aws_ami" "redhat8" {
  most_recent = true

  filter {
    name   = "name"
    values = ["RHEL-8.8.0_HVM-20230623-x86_64-3-Hourly2-GP2"]
  }
}

resource "aws_key_pair" "aws_network_demo" {
  key_name   = "kp-aws_network_demo"
  public_key = file("~/.ssh/id_ed25519_aws_demo.pub")
}

locals {
  private_key = file("~/.ssh/id_ed25519_aws_demo")
}
