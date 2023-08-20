output "ec2_private_ip" {
  value = {
    aws_admin_jump1   = aws_instance.aws_admin_jump1.private_ip
    # aws_admin_jump2   = aws_instance.aws_admin_jump2.private_ip
    aws_private_node1 = aws_instance.aws_private_node1.private_ip
    aws_public_node1  = aws_instance.aws_public_node1.private_ip
    # aws_ig1           = aws_nat_gateway.ngw-aws_admin_internet1.private_ip
  }
}

output "ec2_public_ip" {
  value = {
    aws_admin_jump1   = aws_instance.aws_admin_jump1.public_ip
    # aws_admin_jump2   = aws_instance.aws_admin_jump2.public_ip
    aws_private_node1 = aws_instance.aws_private_node1.public_ip
    aws_public_node1  = aws_instance.aws_public_node1.public_ip
    # aws_ig1           = aws_nat_gateway.ngw-aws_admin_internet1.public_ip
  }
}
