
# # resource "aws_key_pair" "example" {
# #   key_name   = "tf-kp-example"
# #   public_key = file("~/.ssh/id_ed25519_aws_2023-07-30.pub")
# # }

resource "aws_instance" "aws_private_node1" {
  ami           = data.aws_ami.alpine.id
  instance_type = "t2.micro"
  # key_name                    = aws_key_pair.example.key_name
  subnet_id = aws_subnet.aws_private_subnet.id
  # vpc_security_group_ids      = [aws_security_group.example.id]
  associate_public_ip_address = false

  tags = {
    Name  = "aws_private_node1"
    Owner = "John Ajera"
  }
}

resource "aws_instance" "aws_private_node2" {
  ami           = data.aws_ami.alpine.id
  instance_type = "t2.micro"
  # key_name                    = aws_key_pair.example.key_name
  subnet_id = aws_subnet.aws_private_subnet.id
  # vpc_security_group_ids      = [aws_security_group.example.id]
  associate_public_ip_address = true

  tags = {
    Name  = "aws_private_node2"
    Owner = "John Ajera"
  }
}

resource "aws_instance" "aws_private_node3" {
  ami           = data.aws_ami.alpine.id
  instance_type = "t2.micro"
  # key_name                    = aws_key_pair.example.key_name
  subnet_id = aws_subnet.aws_private_subnet.id
  # vpc_security_group_ids      = [aws_security_group.example.id]
  associate_public_ip_address = true

  tags = {
    Name  = "aws_private_node3"
    Owner = "John Ajera"
  }
}

resource "aws_instance" "aws_public_node1" {
  ami           = data.aws_ami.alpine.id
  instance_type = "t2.micro"
  # key_name                    = aws_key_pair.example.key_name
  subnet_id = aws_subnet.aws_public_subnet.id
  # vpc_security_group_ids      = [aws_security_group.example.id]
  associate_public_ip_address = false

  tags = {
    Name  = "aws_public_node1"
    Owner = "John Ajera"
  }
}

resource "aws_instance" "aws_public_node2" {
  ami           = data.aws_ami.alpine.id
  instance_type = "t2.micro"
  # key_name                    = aws_key_pair.example.key_name
  subnet_id = aws_subnet.aws_public_subnet.id
  # vpc_security_group_ids      = [aws_security_group.example.id]
  associate_public_ip_address = true

  tags = {
    Name  = "aws_public_node2"
    Owner = "John Ajera"
  }
}

resource "aws_instance" "aws_public_node3" {
  ami           = data.aws_ami.alpine.id
  instance_type = "t2.micro"
  # key_name                    = aws_key_pair.example.key_name
  subnet_id = aws_subnet.aws_public_subnet.id
  # vpc_security_group_ids      = [aws_security_group.example.id]
  associate_public_ip_address = true

  tags = {
    Name  = "aws_public_node3"
    Owner = "John Ajera"
  }
}