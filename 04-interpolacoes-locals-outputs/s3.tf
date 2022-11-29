resource "aws_s3_bucket" "object" {
  // A interpolação serve para chamar variáveis
  bucket = "${random_pet.bucket.id}-${var.Environment}"

  tags = local.common_tags
}

// Fazer upload de um arquivo local para o bucket

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.object.bucket

  key = "config/${local.ip_filepath}"

  source = local.ip_filepath

  etag = filemd5(local.ip_filepath)
}

// Importando bucket que já existe no AWS

resource "aws_s3_bucket" "manual" {
  # (resource arguments)

  bucket = "meubucketpedros"

  tags = local.common_tags
}

