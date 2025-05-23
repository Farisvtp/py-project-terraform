provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "flask_app" {
  ami             = "ami-0e35ddab05955cf57" 
  instance_type   = "t2.micro"
  key_name        = "mumbaikey"
  vpc_security_group_ids = ["sg-01642b57859c1bc69"]

  tags = {
    Name = "FlaskAppServer"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install -y docker.io -y",
      "sudo systemctl enable docker",
      "sudo systemctl start docker",
      "sudo docker run -d -p 5005:5005 faris7/flask-app:latest"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("./mumbaikey.pem")  
      host        = self.public_ip
    }
  }
}
