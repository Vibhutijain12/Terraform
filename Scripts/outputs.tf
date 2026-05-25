# output "aws_public_ip" {
#     value = aws_instance.remote_server.public_ip
#     description = "The public IP address of the EC2 instance"
# }
# output "aws_instance_id" {
#     value = aws_instance.remote_server.id
#     description = "The ID of the EC2 instance"
# }

## meta arguments are used to create multiple instances with the same configuration. In this case, we are creating two instances (server1 and server2) using the for_each meta-argument. The tomap function is used to create a map of instance names to their respective instance types, which allows us to iterate over them and create multiple instances with the same configuration. The each.value is used to reference the instance type for each instance being created.
output "aws_public_ip" {
    value = [
        for instance in aws_instance.remote_server : instance.public_ip
    ]
}

output "aws_private_ip" {
    value = [
        for instance in aws_instance.remote_server : instance.private_ip
    ]
}

output "aws_instance_id" {
    value = [
        for instance in aws_instance.remote_server : instance.id
    ]
}
