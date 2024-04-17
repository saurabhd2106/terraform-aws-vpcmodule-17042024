
resource "aws_instance" "public_ec2" {
  ami                         = var.ami_image
  instance_type               = var.instance_type
  key_name                    = "myKey-saur"
  availability_zone           = var.availability_zone["public_subnet_az"]
  vpc_security_group_ids      = [aws_security_group.public_sg.id]
  subnet_id                   = aws_subnet.subnets["public_subnet"].id
  associate_public_ip_address = true
  user_data                   = <<-EOF
        #!/bin/bash
        sudo apt update -y
        sudo apt install apache2 -y
        sudo systemctl start apache2
        sudo systemctl enable apache2
        echo "<html><body><h1>Hi there! This is Saurabhs public VM</h1></body></html>" > /var/www/html/index.html
        EOF


  tags = {
    Name = "public_vm"

  }


}


resource "aws_instance" "private_ec2" {

  ami                    = var.ami_image
  instance_type          = var.instance_type
  key_name               = "myKey-saur"
  availability_zone      = var.availability_zone["private_subnet_az"]
  vpc_security_group_ids = [aws_security_group.private_sg.id]
  subnet_id              = aws_subnet.subnets["private_subnet"].id
  user_data              = <<-EOF
        #!/bin/bash
         #!/bin/bash
        sudo apt update -y
        sudo apt install apache2 -y
        sudo systemctl start apache2
        sudo systemctl enable apache2
        echo "<html><body><h1>Hi there</h1></body></html>" > /var/www/html/index.html
        EOF


  tags = {
    Name = "private_vm"
    env  = "test"
  }


}

