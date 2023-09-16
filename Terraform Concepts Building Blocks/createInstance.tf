
resource "aws_key_pair" "levelup_key" {
  key_name   = "levelup_key"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}


resource "aws_instance" "MyFirstInstance" {
    count = 3
    ami = "ami-0f29c8402f8cce65c"
    instance_type = "t2.micro"

    tags = {
        Name = "threedemoinstance-${count.index}"
    }

 /*file provisoner copies files or directories from the machine running Terraform 
   to the newly created resource */
 # Copies the  to
  provisioner "file" {
    source     = "installNginx.sh"
    destination = "/tmp/installNginx.sh"
  }

  /*remote-exec provisioner invokes a script on a remote resource after it is created. This can be used to run a configuration management tool, bootstrap into a cluster, etc.The remote-exec provisioner requires a connection and supports both ssh and winrm. */
    provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/installNginx.sh",
      "sudo /tmp/installNiginx.sh",
    ]
  }

   # Establishes connection to be used by all
  # generic remote provisioners (i.e. file/remote-exec)
  connection {
    type     = "ssh"
    user     = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
    host     = coalesce(self.public_ip, self.private_ip)
  }

  
}