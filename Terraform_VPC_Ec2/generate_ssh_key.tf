# 1. Null Resource to Generate SSH Key
resource "null_resource" "generate_ssh_key" {
  
  # Local-exec provisioner to run commands on the local machine
  provisioner "local-exec" {
    command = <<EOT
      # Remove existing SSH key files if they exist
      if [ -f ${path.module}/levelup_key ]; then
        rm -f ${path.module}/levelup_key
        rm -f ${path.module}/levelup_key.pub
      fi
      # Generate a new SSH key pair
      ssh-keygen -t rsa -b 2048 -f ${path.module}/levelup_key -N ""
    EOT
  }

  # Triggers to force resource recreation if the public key file does not exist
  triggers = {
    force_recreate = fileexists("${path.module}/levelup_key.pub") ? "" : timestamp()
  }
}

# 2. Data Source to Read the Public Key File
data "local_file" "public_key" {
  depends_on = [null_resource.generate_ssh_key]
  filename   = "${path.module}/levelup_key.pub"
}
