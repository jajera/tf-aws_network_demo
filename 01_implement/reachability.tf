resource "aws_ec2_network_insights_path" "aws_admin_jh1_to_aws_admin_jh2" {
  source      = aws_instance.aws_admin_jump1.id
  destination = aws_instance.aws_admin_jump2.id
  protocol    = "tcp"

  tags = {
    Name  = "aws_admin_jh1_to_aws_admin_jh2"
    Owner = "John Ajera"
  }
}

resource "aws_ec2_network_insights_analysis" "aws_admin_jh1_to_aws_admin_jh2" {
  network_insights_path_id = aws_ec2_network_insights_path.aws_admin_jh1_to_aws_admin_jh2.id

  tags = {
    Name  = "aws_admin_jh1_to_aws_admin_jh2"
    Owner = "John Ajera"
  }
}

resource "aws_ec2_network_insights_path" "aws_admin_jh2_to_aws_admin_jh1" {
  source      = aws_instance.aws_admin_jump1.id
  destination = aws_instance.aws_admin_jump2.id
  protocol    = "tcp"

  tags = {
    Name  = "aws_admin_jh2_to_aws_admin_jh1"
    Owner = "John Ajera"
  }
}

resource "aws_ec2_network_insights_analysis" "aws_admin_jh2_to_aws_admin_jh1" {
  network_insights_path_id = aws_ec2_network_insights_path.aws_admin_jh2_to_aws_admin_jh1.id

  tags = {
    Name  = "aws_admin_jh2_to_aws_admin_jh1"
    Owner = "John Ajera"
  }
}

resource "aws_ec2_network_insights_path" "aws_admin_jh1_to_aws_pub_n1" {
  source      = aws_instance.aws_admin_jump1.id
  destination = aws_instance.aws_public_node1.id
  protocol    = "tcp"

  tags = {
    Name  = "aws_admin_jh1_to_aws_pub_n1"
    Owner = "John Ajera"
  }
}

resource "aws_ec2_network_insights_analysis" "aws_admin_jh1_to_aws_pub_n1" {
  network_insights_path_id = aws_ec2_network_insights_path.aws_admin_jh1_to_aws_pub_n1.id

  tags = {
    Name  = "aws_admin_jh1_to_aws_pub_n1"
    Owner = "John Ajera"
  }
}

resource "aws_ec2_network_insights_path" "aws_admin_jh1_to_aws_pvt_n1" {
  source      = aws_instance.aws_admin_jump1.id
  destination = aws_instance.aws_private_node1.id
  protocol    = "tcp"

  tags = {
    Name  = "aws_admin_jh1_to_aws_pvt_n1"
    Owner = "John Ajera"
  }
}

resource "aws_ec2_network_insights_analysis" "aws_admin_jh1_to_aws_pvt_n1" {
  network_insights_path_id = aws_ec2_network_insights_path.aws_admin_jh1_to_aws_pvt_n1.id

  tags = {
    Name  = "aws_admin_jh1_to_aws_pvt_n1"
    Owner = "John Ajera"
  }
}

resource "aws_ec2_network_insights_path" "aws_aws_pub_n1_to_admin_jh1" {
  source      = aws_instance.aws_public_node1.id
  destination = aws_instance.aws_admin_jump1.id
  protocol    = "tcp"

  tags = {
    Name  = "aws_aws_pub_n1_to_admin_jh1"
    Owner = "John Ajera"
  }
}

resource "aws_ec2_network_insights_analysis" "aws_aws_pub_n1_to_admin_jh1" {
  network_insights_path_id = aws_ec2_network_insights_path.aws_aws_pub_n1_to_admin_jh1.id

  tags = {
    Name  = "aws_aws_pub_n1_to_admin_jh1"
    Owner = "John Ajera"
  }
}

resource "aws_ec2_network_insights_path" "aws_aws_pvt_n1_to_admin_jh1" {
  source      = aws_instance.aws_private_node1.id
  destination = aws_instance.aws_admin_jump1.id
  protocol    = "tcp"

  tags = {
    Name  = "aws_aws_pvt_n1_to_admin_jh1"
    Owner = "John Ajera"
  }
}

resource "aws_ec2_network_insights_analysis" "aws_aws_pvt_n1_to_admin_jh1" {
  network_insights_path_id = aws_ec2_network_insights_path.aws_aws_pvt_n1_to_admin_jh1.id

  tags = {
    Name  = "aws_aws_pvt_n1_to_admin_jh1"
    Owner = "John Ajera"
  }
}

resource "aws_ec2_network_insights_path" "aws_pub_n1_to_aws_pub_n2" {
  source      = aws_instance.aws_public_node1.id
  destination = aws_instance.aws_public_node2.id
  protocol    = "tcp"

  tags = {
    Name  = "aws_pub_n1_to_aws_pub_n2"
    Owner = "John Ajera"
  }
}

resource "aws_ec2_network_insights_analysis" "aws_pub_n1_to_aws_pub_n2" {
  network_insights_path_id = aws_ec2_network_insights_path.aws_pub_n1_to_aws_pub_n2.id

  tags = {
    Name  = "aws_pub_n1_to_aws_pub_n2"
    Owner = "John Ajera"
  }
}

resource "aws_ec2_network_insights_path" "aws_pub_n2_to_aws_pub_n1" {
  source      = aws_instance.aws_public_node2.id
  destination = aws_instance.aws_public_node1.id
  protocol    = "tcp"

  tags = {
    Name  = "aws_pub_n2_to_aws_pub_n1"
    Owner = "John Ajera"
  }
}

resource "aws_ec2_network_insights_analysis" "aws_pub_n2_to_aws_pub_n1" {
  network_insights_path_id = aws_ec2_network_insights_path.aws_pub_n2_to_aws_pub_n1.id

  tags = {
    Name  = "aws_pub_n2_to_aws_pub_n1"
    Owner = "John Ajera"
  }
}

resource "aws_ec2_network_insights_path" "aws_pvt_n1_to_aws_pvt_n2" {
  source      = aws_instance.aws_private_node1.id
  destination = aws_instance.aws_private_node2.id
  protocol    = "tcp"

  tags = {
    Name  = "aws_pvt_n1_to_aws_pvt_n2"
    Owner = "John Ajera"
  }
}

resource "aws_ec2_network_insights_analysis" "aws_pvt_n1_to_aws_pvt_n2" {
  network_insights_path_id = aws_ec2_network_insights_path.aws_pvt_n1_to_aws_pvt_n2.id

  tags = {
    Name  = "aws_pvt_n1_to_aws_pvt_n2"
    Owner = "John Ajera"
  }
}

resource "aws_ec2_network_insights_path" "aws_pvt_n2_to_aws_pvt_n1" {
  source      = aws_instance.aws_private_node2.id
  destination = aws_instance.aws_private_node1.id
  protocol    = "tcp"

  tags = {
    Name  = "aws_pvt_n2_to_aws_pvt_n1"
    Owner = "John Ajera"
  }
}

resource "aws_ec2_network_insights_analysis" "aws_pvt_n2_to_aws_pvt_n1" {
  network_insights_path_id = aws_ec2_network_insights_path.aws_pvt_n2_to_aws_pvt_n1.id

  tags = {
    Name  = "aws_pvt_n2_to_aws_pvt_n1"
    Owner = "John Ajera"
  }
}

# resource "aws_ec2_network_insights_path" "aws_pub_n1_to_aws_pvt_n1" {
#   source      = aws_instance.aws_public_node1.id
#   destination = aws_instance.aws_private_node1.id
#   protocol    = "tcp"

#   tags = {
#     Name  = "aws_pub_n1_to_aws_pvt_n1"
#     Owner = "John Ajera"
#   }
# }

# resource "aws_ec2_network_insights_analysis" "aws_pub_n1_to_aws_pvt_n1" {
#   network_insights_path_id = aws_ec2_network_insights_path.aws_pub_n1_to_aws_pvt_n1.id

#   tags = {
#     Name  = "aws_pub_n1_to_aws_pvt_n1"
#     Owner = "John Ajera"
#   }
# }

# resource "aws_ec2_network_insights_path" "aws_pvt_n1_to_aws_pub_n1" {
#   source      = aws_instance.aws_private_node1.id
#   destination = aws_instance.aws_public_node1.id
#   protocol    = "tcp"

#   tags = {
#     Name  = "aws_pvt_n1_to_aws_pub_n1"
#     Owner = "John Ajera"
#   }
# }

# resource "aws_ec2_network_insights_analysis" "aws_pvt_n1_to_aws_pub_n1" {
#   network_insights_path_id = aws_ec2_network_insights_path.aws_pvt_n1_to_aws_pub_n1.id

#   tags = {
#     Name  = "aws_pvt_n1_to_aws_pub_n1"
#     Owner = "John Ajera"
#   }
# }

# resource "aws_ec2_network_insights_path" "aws_pvt_n1_to_aws_ig1" {
#   source      = aws_instance.aws_private_node1.id
#   destination = aws_internet_gateway.aws_ig1.id
#   protocol    = "tcp"

#   tags = {
#     Name  = "aws_pvt_n1_to_aws_ig1"
#     Owner = "John Ajera"
#   }
# }

# resource "aws_ec2_network_insights_analysis" "aws_pvt_n1_to_aws_ig1" {
#   network_insights_path_id = aws_ec2_network_insights_path.aws_pvt_n1_to_aws_ig1.id

#   tags = {
#     Name  = "aws_pvt_n1_to_aws_ig1"
#     Owner = "John Ajera"
#   }
# }

# resource "aws_ec2_network_insights_path" "aws_ig1_to_aws_pvt_n1" {
#   source      = aws_internet_gateway.aws_ig1.id
#   destination = aws_instance.aws_private_node1.id
#   protocol    = "tcp"

#   tags = {
#     Name  = "aws_ig1_to_aws_pvt_n1"
#     Owner = "John Ajera"
#   }
# }

# resource "aws_ec2_network_insights_analysis" "aws_ig1_to_aws_pvt_n1" {
#   network_insights_path_id = aws_ec2_network_insights_path.aws_ig1_to_aws_pvt_n1.id

#   tags = {
#     Name  = "aws_ig1_to_aws_pvt_n1"
#     Owner = "John Ajera"
#   }
# }

# resource "aws_ec2_network_insights_path" "aws_pvt_n2_to_aws_ig1" {
#   source      = aws_instance.aws_private_node2.id
#   destination = aws_internet_gateway.aws_ig1.id
#   protocol    = "tcp"

#   tags = {
#     Name  = "aws_pvt_n2_to_aws_ig1"
#     Owner = "John Ajera"
#   }
# }

# resource "aws_ec2_network_insights_analysis" "aws_pvt_n2_to_aws_ig1" {
#   network_insights_path_id = aws_ec2_network_insights_path.aws_pvt_n2_to_aws_ig1.id

#   tags = {
#     Name  = "aws_pvt_n2_to_aws_ig1"
#     Owner = "John Ajera"
#   }
# }

# resource "aws_ec2_network_insights_path" "aws_ig1_to_aws_pvt_n2" {
#   source      = aws_internet_gateway.aws_ig1.id
#   destination = aws_instance.aws_private_node2.id
#   protocol    = "tcp"

#   tags = {
#     Name  = "aws_ig1_to_aws_pvt_n2"
#     Owner = "John Ajera"
#   }
# }

# resource "aws_ec2_network_insights_analysis" "aws_ig1_to_aws_pvt_n2" {
#   network_insights_path_id = aws_ec2_network_insights_path.aws_ig1_to_aws_pvt_n2.id

#   tags = {
#     Name  = "aws_ig1_to_aws_pvt_n2"
#     Owner = "John Ajera"
#   }
# }


# # resource "aws_ec2_network_insights_path" "aws_pub_n1_to_aws_ig1" {
# #   source      = aws_instance.aws_private_node1.id
# #   destination = aws_internet_gateway.aws_ig.id
# #   protocol    = "tcp"

# #   tags = {
# #     Name  = "aws_pub_n1_to_aws_ig1"
# #     Owner = "John Ajera"
# #   }
# # }

# # resource "aws_ec2_network_insights_analysis" "aws_pub_n1_to_aws_ig1" {
# #   network_insights_path_id = aws_ec2_network_insights_path.aws_pub_n1_to_aws_ig1.id

# #   tags = {
# #     Name  = "aws_pub_n1_to_aws_ig1"
# #     Owner = "John Ajera"
# #   }
# # }

# # resource "aws_ec2_network_insights_path" "aws_ig1_to_aws_pub_n1" {
# #   source      = aws_internet_gateway.aws_ig.id
# #   destination = aws_instance.aws_private_node1.id
# #   protocol    = "tcp"

# #   tags = {
# #     Name  = "aws_ig1_to_aws_pub_n1"
# #     Owner = "John Ajera"
# #   }
# # }

# # resource "aws_ec2_network_insights_analysis" "aws_ig1_to_aws_pub_n1" {
# #   network_insights_path_id = aws_ec2_network_insights_path.aws_ig1_to_aws_pub_n1.id

# #   tags = {
# #     Name  = "aws_ig1_to_aws_pub_n1"
# #     Owner = "John Ajera"
# #   }
# # }
