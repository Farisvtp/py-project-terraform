provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "flask_app" {
  ami             = "ami-0f5ee92e2d63afc18" # Ubuntu 22.04 LTS
  instance_type   = "t2.micro"
  key_name        = mumbainew
  vpc_security_group_ids = ["sg-03c336cea0369f7ab"]

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
      private_key = file("./mumbainew.pem")  
      host        = self.public_ip
    }
  }
}
