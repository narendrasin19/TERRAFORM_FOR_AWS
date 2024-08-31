# Define the AWS Key Pair resource
resource "aws_key_pair" "levelup_key" {

  # Key name for the key pair
  key_name   = "levelup_key"

  # Public key content
  public_key = data.local_file.public_key.content
}
