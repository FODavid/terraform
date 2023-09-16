variable "AWS_ACCESS_KEY" {}

variable "AWS_REGION" {
    default = "us-east-1"
}

variable "Security_Group" {
    type = list
    default = ["sg-24076", "sg-90890", "sg-456789"]
  
}

variable "AMIS" {
    type = map
    default = {
        us-east-1 = "us-east-1"
        us-east-2 = "us-east-1"
        us-east-3 = "us-east-3"  
    }
}

variable "PATH_TO_PRIVATE_KEY" {
    default = "levelup_key"
  
}

variable "PATH_TO_PUBLIC_KEY" {
    default = "levelup_key.pub"
  
}

variable "INSTANCE_USERNAME" {
    default = "ubuntu"
  
}