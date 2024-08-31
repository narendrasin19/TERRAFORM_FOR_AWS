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

  triggers = {
    force_recreate = fileexists("${path.module}/levelup_key.pub") ? "" : timestamp()
  }
}

data "local_file" "public_key" {
  depends_on = [null_resource.generate_ssh_key]
  filename   = "${path.module}/levelup_key.pub"
}
