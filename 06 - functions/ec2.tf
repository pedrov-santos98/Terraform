resource "aws_instance" "server" {

// O count serve para controlar a quantidade de recursos 
    count = local.instance_number <= 0 ? 0 : local.instance_number

    ami = var.instance_ami

    instance_type = lookup(var.instance_type, var.env)

// Função merge serve para juntar dois tipos de dados iguais neste caso estamos acrescentando mais tags
    tags = merge(
        local.common_tags,

        {
            Project = "Curso AWS com Terraform"
            Env = format("%s", var.env)
            Name = format("Instance %d", count.index + 1)
        }
    )
  
}