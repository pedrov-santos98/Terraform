variable "aws_region" {
  type        = string
  description = ""
  default     = "us-east-2"
}

variable "aws_profile" {
  type        = string
  description = ""
  default     = ""
}

variable "instance_type" {
  type        = string
  description = ""
  default     = "t3.micro"
}