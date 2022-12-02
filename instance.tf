resource "aws_instance" "webserver01" {
    ami = "ami-062df10d14676e201"
    # ami = var.image_id

    instance_type = "t2.micro"

    # tags = var.default_tags

    tags = {
        Name = "Pavans Ubuntu Machine"
        email = "123@gmail.com"
    }
    key_name = "ap-south-1-terraform-demo"
    vpc_security_group_ids = [aws_security_group.mysg.id]
}

resource "aws_key_pair" "mykey" {
    key_name = "ap-south-1-terraform-demo"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDWUcaefTZK6wmAiB2lsxWBobpc6tYwQeslkbBQKqpQjs1pg6KhQH+E56Zl+7X+fpt850DWhY3+WIyx+xoYanHkWdDuCw+lCi4dng7V+NChacC7dNEodXNoO9XMjIrRNFTcP+ZE+Q6c4MUmFJDg/9dusfX6zzY61M1+qJqj/ByAC8vn1XT8u1HaWzw0Ib7P1ce9GmM9E84N/r4MQu4xg1ixBG5TwCRT7KpSqkHLN9Vtu2dtUX2tikNl3mffJuUDaOwI2DUVzjdEnsQ2+alxtMJ//WXrP5BwhWoqf/ivGi6dFaOYSabSZoORRhuZVnSf2GoumhbwrmYCJuTAvwvSZibDXRCTzfgo1qwH56IwxDeaKtX54edER87QrDNrMtBCjMooMCP27PK/aqZR05F/zAceQO1UP9bUbqYHkRW/1BE1dnpZk/byeay1kppwOQ3e5NYJvl0pRSpbQ3zUBlHoAzE+OEzuT1rQ/Z8vcyK1DHtQsnd4UQad9wXC436MXSLFnxM= Harika@DESKTOP-LQABQG1"
}

resource "aws_security_group"  "mysg" {
    egress = [
        {
            cidr_blocks = ["0.0.0.0/0",]
            description = "Pavans home network"
            from_port = 0
            protocol = "-1"
            to_port = 0
            ipv6_cidr_blocks = []
            prefix_list_ids = []
            security_groups = []
            self = false
        }
    ]

    ingress = [
        {
            cidr_blocks = ["0.0.0.0/0",]
            description = "Pavans home network"
            from_port = 0
            protocol = "-1"
            to_port = 0
            ipv6_cidr_blocks = []
            prefix_list_ids = []
            security_groups = []
            self = false
            }
        ]
}