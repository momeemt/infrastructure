terraform {
  required_version = "1.6.4"

  backend "s3" {
    bucket = "terraform"
    key = "terraform.tfstate"
  }
}

