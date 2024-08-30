# Generate SSH Key Pair
resource "null_resource" "generate_ssh_key" {
  provisioner "local-exec" {
    command = <<EOT
      # Remove existing SSH key files if they exist
      if [ -f ${path.module}/levelup_key ]; then
        rm -f ${path.module}/levelup_key
        rm -f ${path.module}/levelup_key.pub
      fi
      
      # Generate a new RSA SSH key pair with a key length of 2048 bits
      ssh-keygen -t rsa -b 2048 -f ${path.module}/levelup_key -N ""
    EOT
  }

  # Trigger to force recreation of the SSH key pair if the public key file does not exist
  triggers = {
    force_recreate = fileexists("${path.module}/levelup_key.pub") ? "" : timestamp()
  }
}

# Read Public Key File
data "local_file" "public_key" {
  depends_on = [null_resource.generate_ssh_key] # Ensure SSH key generation is complete before reading
  filename   = "${path.module}/levelup_key.pub"  # Path to the public key file
}
