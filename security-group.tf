# Create a AWS Security Group
# resource "aws_security_group" "us-east-1-allow_ssh" {
#   provider = aws.us-east-1
#   name        = "allow_ssh"
#   description = "Allow SSH inbound traffic"
#   # vpc_id      = aws_vpc.id

#   ingress = [
#     {
#       description      = "Allow SSH"
#       from_port        = 22
#       to_port          = 22
#       protocol         = "tcp"
#       cidr_blocks      = var.cdirs_allowed_ssh
#       ipv6_cidr_blocks = []
#       prefix_list_ids  = []
#       security_groups  = []
#       self             = false
#     }
#   ]

#   tags = {
#     Name = "ssh"
#   }
# }

resource "aws_security_group" "us-east-2-rules-prod-instance" {
  provider = aws.us-east-2
  name        = "Rules Prod Instance"
  description = "Allow SSH inbound traffic and Allow HTTP/HTTPS outbound traffic"
  # vpc_id      = aws_vpc.id

  ingress = [
    {
      description      = "Allow SSH"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = var.cdirs_allowed_ssh
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress = [
    {
      description      = "Allow HTTP"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },

    {
      description      = "Allow HTTPS"
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  tags = {
    Name = "Rules Prod Instance"
  }
}