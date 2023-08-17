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
