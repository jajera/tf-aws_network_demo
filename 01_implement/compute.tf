resource "aws_instance" "aws_admin_jump1" {
  ami           = data.aws_ami.redhat8.id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.aws_network_demo.key_name
  subnet_id     = aws_subnet.sn-aws_admin_subnet.id
  vpc_security_group_ids = [
    aws_security_group.sgrp-aws_jumphost.id
  ]
  associate_public_ip_address = true

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = "${local.private_key}"
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "echo \"${aws_key_pair.aws_network_demo.public_key}\" > ~/.ssh/id_ed25519_aws_demo.pub",
      "echo \"${local.private_key}\" > ~/.ssh/id_ed25519_aws_demo",
      "eval \"$(ssh-agent -s)\"",
      "chown ec2-user:ec2-user -R ~/.ssh",
      "chmod go-rwx ~/.ssh/id_ed25519_aws_demo",
      "chmod go-rwx ~/.ssh/id_ed25519_aws_demo.pub",
      "ssh-add ~/.ssh/id_ed25519_aws_demo"
    ]
  }

  tags = {
    Name  = "ec2-aws_admin_jump1"
    Owner = "John Ajera"
  }
}

resource "aws_instance" "aws_admin_jump2" {
  ami           = data.aws_ami.redhat8.id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.aws_network_demo.key_name
  subnet_id     = aws_subnet.sn-aws_admin_subnet.id
  vpc_security_group_ids = [
    aws_security_group.sgrp-aws_jumphost.id
  ]
  associate_public_ip_address = false

  user_data = <<-EOF
    #!/bin/bash
    echo "${aws_key_pair.aws_network_demo.public_key}" > /home/ec2-user/.ssh/id_ed25519_aws_demo.pub
    echo "${local.private_key}" > /home/ec2-user/.ssh/id_ed25519_aws_demo
    EOF

  tags = {
    Name  = "ec2-aws_admin_jump2"
    Owner = "John Ajera"
  }
}

resource "aws_instance" "aws_private_node1" {
  ami           = data.aws_ami.alpine.id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.aws_network_demo.key_name
  subnet_id     = aws_subnet.sn-aws_pvt_subnet.id
  vpc_security_group_ids = [
    aws_security_group.sgrp-aws_private.id
  ]
  associate_public_ip_address = true

  tags = {
    Name  = "ec2-aws_private_node1"
    Owner = "John Ajera"
  }
}

resource "aws_instance" "aws_private_node2" {
  ami           = data.aws_ami.alpine.id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.aws_network_demo.key_name
  subnet_id     = aws_subnet.sn-aws_pvt_subnet.id
  vpc_security_group_ids = [
    aws_security_group.sgrp-aws_private.id
  ]
  associate_public_ip_address = false

  tags = {
    Name  = "ec2-aws_private_node2"
    Owner = "John Ajera"
  }
}

# resource "aws_instance" "aws_private_node3" {
#   ami           = data.aws_ami.alpine.id
#   instance_type = "t2.micro"
#   # key_name                    = aws_key_pair.example.key_name
#   subnet_id = aws_subnet.aws_private_subnet.id
#   # vpc_security_group_ids      = [aws_security_group.example.id]
#   associate_public_ip_address = true

#   tags = {
#     Name  = "ec2-aws_private_node3"
#     Owner = "John Ajera"
#   }
# }

resource "aws_instance" "aws_public_node1" {
  ami           = data.aws_ami.alpine.id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.aws_network_demo.key_name
  subnet_id     = aws_subnet.sn-aws_pub_subnet.id
  vpc_security_group_ids = [
    aws_security_group.sgrp-aws_public.id
  ]
  associate_public_ip_address = true

  tags = {
    Name  = "ec2-aws_public_node1"
    Owner = "John Ajera"
  }
}

resource "aws_instance" "aws_public_node2" {
  ami           = data.aws_ami.alpine.id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.aws_network_demo.key_name
  subnet_id     = aws_subnet.sn-aws_pub_subnet.id
  vpc_security_group_ids = [
    aws_security_group.sgrp-aws_public.id
  ]
  associate_public_ip_address = false

  tags = {
    Name  = "ec2-aws_public_node2"
    Owner = "John Ajera"
  }
}

# resource "aws_instance" "aws_public_node3" {
#   ami           = data.aws_ami.alpine.id
#   instance_type = "t2.micro"
#   # key_name                    = aws_key_pair.example.key_name
#   subnet_id = aws_subnet.aws_public_subnet.id
#   # vpc_security_group_ids      = [aws_security_group.example.id]
#   associate_public_ip_address = true

#   tags = {
#     Name  = "ec2-aws_public_node3"
#     Owner = "John Ajera"
#   }
# }
