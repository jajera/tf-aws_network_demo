resource "aws_ec2_network_insights_path" "aws_pub1_to_pub2" {
  source      = aws_instance.aws_public_node1.id
  destination = aws_instance.aws_public_node2.id
  protocol    = "tcp"

  tags = {
    Name  = "aws_pub1_to_pub2"
    Owner = "John Ajera"
  }
}

resource "aws_ec2_network_insights_analysis" "aws_pub1_to_pub2" {
  network_insights_path_id = aws_ec2_network_insights_path.aws_pub1_to_pub2.id

  tags = {
    Name  = "aws_pub1_to_pub2"
    Owner = "John Ajera"
  }
}

resource "aws_ec2_network_insights_path" "aws_pub1_to_pub3" {
  source      = aws_instance.aws_public_node1.id
  destination = aws_instance.aws_public_node3.id
  protocol    = "tcp"

  tags = {
    Name  = "aws_pub1_to_pub3"
    Owner = "John Ajera"
  }
}

resource "aws_ec2_network_insights_analysis" "aws_pub1_to_pub3" {
  network_insights_path_id = aws_ec2_network_insights_path.aws_pub1_to_pub3.id

  tags = {
    Name  = "aws_pub1_to_pub3"
    Owner = "John Ajera"
  }
}

resource "aws_ec2_network_insights_path" "aws_pvt1_to_pvt2" {
  source      = aws_instance.aws_private_node1.id
  destination = aws_instance.aws_private_node2.id
  protocol    = "tcp"

  tags = {
    Name  = "aws_pvt1_to_pvt2"
    Owner = "John Ajera"
  }
}

resource "aws_ec2_network_insights_analysis" "aws_pvt1_to_pvt2" {
  network_insights_path_id = aws_ec2_network_insights_path.aws_pvt1_to_pvt2.id

  tags = {
    Name  = "aws_pvt1_to_pvt2"
    Owner = "John Ajera"
  }
}

resource "aws_ec2_network_insights_path" "aws_pvt1_to_pvt3" {
  source      = aws_instance.aws_private_node1.id
  destination = aws_instance.aws_private_node3.id
  protocol    = "tcp"

  tags = {
    Name  = "aws_pvt1_to_pvt3"
    Owner = "John Ajera"
  }
}

resource "aws_ec2_network_insights_analysis" "aws_pvt1_to_pvt3" {
  network_insights_path_id = aws_ec2_network_insights_path.aws_pvt1_to_pvt3.id

  tags = {
    Name  = "aws_pvt1_to_pvt3"
    Owner = "John Ajera"
  }
}

resource "aws_ec2_network_insights_path" "aws_pub1_to_pvt1" {
  source      = aws_instance.aws_public_node1.id
  destination = aws_instance.aws_private_node1.id
  protocol    = "tcp"

  tags = {
    Name  = "aws_pub1_to_pvt1"
    Owner = "John Ajera"
  }
}

resource "aws_ec2_network_insights_analysis" "aws_pub1_to_pvt1" {
  network_insights_path_id = aws_ec2_network_insights_path.aws_pub1_to_pvt1.id

  tags = {
    Name  = "aws_pub1_to_pvt1"
    Owner = "John Ajera"
  }
}

resource "aws_ec2_network_insights_path" "aws_pvt1_to_pub1" {
  source      = aws_instance.aws_private_node1.id
  destination = aws_instance.aws_public_node1.id
  protocol    = "tcp"

  tags = {
    Name  = "aws_pvt1_to_pub1"
    Owner = "John Ajera"
  }
}

resource "aws_ec2_network_insights_analysis" "aws_pvt1_to_pub1" {
  network_insights_path_id = aws_ec2_network_insights_path.aws_pvt1_to_pub1.id

  tags = {
    Name  = "aws_pvt1_to_pub1"
    Owner = "John Ajera"
  }
}

resource "aws_ec2_network_insights_path" "aws_pvt1_to_igw1" {
  source      = aws_instance.aws_private_node1.id
  destination = aws_internet_gateway.aws_ig.id
  protocol    = "tcp"

  tags = {
    Name  = "aws_pvt1_to_igw1"
    Owner = "John Ajera"
  }
}

resource "aws_ec2_network_insights_analysis" "aws_pvt1_to_igw1" {
  network_insights_path_id = aws_ec2_network_insights_path.aws_pvt1_to_igw1.id

  tags = {
    Name  = "aws_pvt1_to_igw1"
    Owner = "John Ajera"
  }
}

resource "aws_ec2_network_insights_path" "igw1_to_aws_pvt1" {
  source      = aws_internet_gateway.aws_ig.id
  destination = aws_instance.aws_private_node1.id
  protocol    = "tcp"

  tags = {
    Name  = "igw1_to_aws_pvt1"
    Owner = "John Ajera"
  }
}

resource "aws_ec2_network_insights_analysis" "igw1_to_aws_pvt1" {
  network_insights_path_id = aws_ec2_network_insights_path.igw1_to_aws_pvt1.id

  tags = {
    Name  = "igw1_to_aws_pvt1"
    Owner = "John Ajera"
  }
}

resource "aws_ec2_network_insights_path" "aws_pub1_to_igw1" {
  source      = aws_instance.aws_private_node1.id
  destination = aws_internet_gateway.aws_ig.id
  protocol    = "tcp"

  tags = {
    Name  = "aws_pub1_to_igw1"
    Owner = "John Ajera"
  }
}

resource "aws_ec2_network_insights_analysis" "aws_pub1_to_igw1" {
  network_insights_path_id = aws_ec2_network_insights_path.aws_pub1_to_igw1.id

  tags = {
    Name  = "aws_pub1_to_igw1"
    Owner = "John Ajera"
  }
}

resource "aws_ec2_network_insights_path" "igw1_to_aws_pub1" {
  source      = aws_internet_gateway.aws_ig.id
  destination = aws_instance.aws_private_node1.id
  protocol    = "tcp"

  tags = {
    Name  = "igw1_to_aws_pub1"
    Owner = "John Ajera"
  }
}

resource "aws_ec2_network_insights_analysis" "igw1_to_aws_pub1" {
  network_insights_path_id = aws_ec2_network_insights_path.igw1_to_aws_pub1.id

  tags = {
    Name  = "igw1_to_aws_pub1"
    Owner = "John Ajera"
  }
}
