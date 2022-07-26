provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "my_instance" {
  ami   = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF

  user_data_replace_on_change = true
  
  tags = {
    Name = "terraform-example-ASLO2"
  }
}