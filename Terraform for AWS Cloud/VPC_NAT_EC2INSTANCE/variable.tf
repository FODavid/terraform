variable "AWS_ACCESS_KEY" {
    type = string
    default = "AKIA5MI2H46R4AYDAUG4"
}

variable "AWS_SECRET_KEY" {
  
}

variable "AWS_REGION" {
    default = "us-east-1"
}

variable "AMIS" {
    type = map
    default = {
        us-east-1 = "ami-0f40c8f97004632fg"
        us-east-2 = "ami-05692172625678b4e"
        us-west-2 = "ami-0352d5a37fb4f603f"  
        us-west-1 = "ami-0f40c8f97004632fg"  
    }
}