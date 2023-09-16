

resource "aws_instance" "MyFirstInstance" {
    ami = lookup(var.AMIS, var.AWS_REGION)
    instance_type = "t2.micro"
    vpc_security_group_ids = [ aws_security_group.allow_ssh.id ]
    subnet_id = aws_subnet.levelup_vpc-public-2.id


    tags = {
        Name = "custom_instance"
    }

}

