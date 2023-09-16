data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_ami" "latest-ubuntu" {
  most_recent      = true
  owners           = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "MyFirstInstance" {
    ami = data.aws_ami.latest-ubuntu.id
    instance_type = "t2.micro"
    availability_zone = data.aws_availability_zones.available.names[0]

    tags = {
        Name = "custom_instance"
    }

}