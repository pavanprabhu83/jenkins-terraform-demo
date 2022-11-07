resource "aws_s3_bucket" "my_bucket_01"{
    bucket = "demo-ap-south-1-terraform-24092022"
    acl = "private"
    tags = {
        Name = "My Bucket"
        Env = "Dev"
        Owner = "Pavan"
    }
}