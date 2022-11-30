variable "env" {}

variable "aws_region" {
  type    = string
  default = "us-east-2"
}

variable "aws_profile" {
  type    = string
  default = "pedro.santos"
}

variable "instance_ami" {
  type    = string
  default = "ami-0beaa649c482330f7"

  // Usando função lenght e substring para criar uma condição 

  validation {
    condition     = length(var.instance_ami) > 4 && substr(var.instance_ami, 0, 4) == "ami-"
    error_message = "O valor da instance_ami deve ser um valor AMI ID valido, começando por \"ami-\"."
  }
}

// Serve para definir a quantidade de recursos que serão criados do tipo DEV e PROD
variable "instance_number" {
  type = object({
    dev  = number
    prod = number
  })

  description = "Numeros de Instancias Criadas"

  default = {
    dev  = 1
    prod = 3
  }
}

variable "instance_type" {
  type = object({
    dev  = string
    prod = string
  })

  description = ""

  default = {
    dev  = "t3.micro"
    prod = "t3.medium"
  }
}