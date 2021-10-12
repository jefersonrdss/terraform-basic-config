# Create a AWS INSTANCES
# resource "aws_instance" "dev1" {
#   provider = aws.us-east-1
#   ami = var.amis["amz-linux-us-east-1"] # Amazon Linux 2 AMI
#   instance_type = "t2.micro"
#   key_name = var.key_name
#   tags = {
#     Name = "dev-instance"
#   }
#   vpc_security_group_ids = [
#     "${aws_security_group.us-east-1-allow_ssh.id}"
#   ]
#   depends_on = [aws_security_group.us-east-1-allow_ssh]
# }

resource "aws_instance" "prod" {
  provider = aws.us-east-2
  ami = var.amis["ubuntu-20-us-east-2"] # ubuntu 20.04 LTS
  instance_type = "t2.micro"
  key_name = var.key_name
  tags = {
    Name = "prod-instance"
  }
  vpc_security_group_ids = [
    "${aws_security_group.us-east-2-rules-prod-instance.id}"
  ]
  depends_on = [aws_security_group.us-east-2-rules-prod-instance]

  # user_data = <<-EOF
  #               #!/bin/bash
  #               sudo apt update
  #               sudp apt upgrade -y
  #               cd ~
  #               echo "Ubuntu 20.04 LTS - System Ready!" > README.md
  #               EOF
}
###