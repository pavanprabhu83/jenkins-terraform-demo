terraform {
  backend "s3" {
    bucket = "ansible-register-demo"
    key    = "remote.tfstate"
    region = "ap-south-1"
  }
}
