variable "aws_region" {
  type = string
  description = ""
  default = "us-east-2"
}

variable "aws_profile" {
  type = string
  description = ""
}

variable "instance_ami" {
  type = string
  description = ""
  default = "ami-0beaa649c482330f7"
}

variable "instance_type" {
  type = string
  description = ""
  default = "t2.micro"
}

variable "instance_tags" {
  type = map(string)
  description = ""
  default = {
    Name = "Ubuntu"
    Project = "Curso AWS com Terraform!"
  }
}
