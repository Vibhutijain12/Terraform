resource "aws_key_pair" "key_pair" {
    key_name = "terra-key-ec2"
    public_key = file("terra-key-ec2.pub")
 }


resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "automate_sg" {
         name ="automate_sg"
         vpc_id = aws_default_vpc.default.id

    ingress {
       from_port = 22
       to_port = 22
       protocol = "tcp"
       cidr_blocks = ["0.0.0.0/0"]
       description = "Allow SSH access"
    }

    ingress {
       from_port = 80
       to_port = 80
       protocol = "tcp"
       cidr_blocks = ["0.0.0.0/0"]
       description = "Allow HTTP access"
    }

    egress { 
       from_port = 0
       to_port = 0
       protocol = "-1"
       cidr_blocks = ["0.0.0.0/0"]
       description = "Allow all outbound traffic"
    }
      tags = {
       Name = "automate_sg"
      }
}

resource "aws_instance" "remote_server" {
     # meta arguments 
      for_each = tomap({
         server1 = var.aws_instance_type
         server2 = var.aws_instance_type
      })
      ami = var.aws_ami_id
      instance_type = each.value   
      key_name = aws_key_pair.key_pair.key_name
      vpc_security_group_ids = [aws_security_group.automate_sg.id]

        root_block_device {
        volume_size = var.aws_root_volume_size
        volume_type = "gp3"
  }

    tags = {
         Name = each.key
     }
     user_data = file("nginx_install.sh")
}

# resource "aws_ec2_instance_state" "remote_server_state" {
#     instance_id = "i-00781f3931e4d8519"
#     state = "running"

# }

resource "aws_instance" "new_server" {
       ami = "unknown"
       instance_type = "unknown"
} 
