**This is a module for deploying AWS VPC with all its components**

Example 

```
module "vpc1" {

  source = "../vpc_module"

  cidr_block                = "20.0.0.0/16"
  vpc_name                  = "myVpc-saurabh-1"
  subnet1_name              = "public_subnet"
  subnet2_name              = "private_subnet"
  public_subnet_cidr_block  = "20.0.1.0/24"
  private_subnet_cidr_block = "20.0.2.0/24"
  availability_zone = {
    "public_subnet_az"  = "us-east-1a"
    "private_subnet_az" = "us-east-1b"
  }

  ig_name = "ig-saurabh"

  ami_image     = "ami-080e1f13689e07408"
  instance_type = "t2.micro"

  subnet = {

    public_subnet = {

      cidr_block = "20.1.0.0/24"

      availability_zone = "us-east-1a"

    }

    private_subnet = {

      cidr_block = "20.2.0.0/24"

      availability_zone = "us-east-1b"

    }

  }

  inbound_rule = {
    allow_port_80 = {

      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

    }

    allow_port_22 = {

      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

    }
  }

}
```
