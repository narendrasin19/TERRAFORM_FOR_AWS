# This file can be used to define your provider configurations separately if you prefer to organize your code that way.
# provider.tf

provider "aws" {
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
  region     = var.AWS_Region
}
