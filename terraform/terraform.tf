terraform {
  required_version = "1.8.3"

  backend "s3" {
    bucket = "terraform"
    key = "terraform.tfstate"
  }
}

