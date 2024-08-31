# SSH Key Generation and Retrieval Configuration

# Resource: SSH Key Generation with Null Resource and Local Exec Provisioner
# This section uses the `null_resource` to generate an SSH key pair using the `local-exec` provisioner.
resource "null_resource" "generate_ssh_key" {
  provisioner "local-exec" {
    command = <<EOT
      if [ -f ${path.module}/levelup_key ]; then
        rm -f ${path.module}/levelup_key
        rm -f ${path.module}/levelup_key.pub
      fi
      ssh-keygen -t rsa -b 2048 -f ${path.module}/levelup_key -N ""
    EOT
  }

  # Triggers block forces recreation of the resource by checking if the public key exists.
  triggers = {
    force_recreate = fileexists("${path.module}/levelup_key.pub") ? "" : timestamp()
  }
}

# Data Source: Local File for Public Key Content
# This section reads the generated SSH public key using the `local_file` data source.
data "local_file" "public_key" {
  depends_on = [null_resource.generate_ssh_key]
  filename   = "${path.module}/levelup_key.pub"
}

# Output the public key content for use in other resources
#output "ssh_public_key" {
#  value = data.local_file.public_key.content
#  description = "The content of the generated SSH public key."
#}
