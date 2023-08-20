resource "null_resource" "generate_ssh_key" {
  provisioner "local-exec" {
    command = <<-EOD
      ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_ed25519_aws_demo -C "ssh key for aws demo"
      eval "$(ssh-agent -s)"
      ssh-add ~/.ssh/id_ed25519_aws_demo
    EOD
  }

  provisioner "local-exec" {
    when    = destroy
    command = <<-EOD
      rm ~/.ssh/id_ed25519_aws_demo
      rm ~/.ssh/id_ed25519_aws_demo.pub
    EOD
  }
}
