variable "amis" {
  type = map
  default = {
      "amz-linux-us-east-1" = "ami-02e136e904f3da870"
      "ubuntu-20-us-east-2" = "ami-00399ec92321828f5"
  }
}

variable "cdirs_allowed_ssh" {
  type = list
  default = ["191.217.88.241/32"]
}

variable "key_name" {
  default = "terraform-aws"
}