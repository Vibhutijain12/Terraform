variable aws_instance_type {
    default = "t2.micro" 
    type = string
    description = "The type of EC2 instance to create"
}

variable aws_ami_id {
    default = "ami-0fe18bc3cfa53a248"
    type = string
    description = "The AMI ID to use for the EC2 instance"
}

# variable aws_instance_name {
#     default = "remote_server"
#     type = string
#     description = "The name tag for the EC2 instance"
# }

variable aws_root_volume_size {
    default = 8
    type = number
    description = "The size of the root EBS volume in GB"
}
