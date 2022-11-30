resource "aws_iam_user" "create-accounts" {

    for_each = toset (["Pedro","Ana","Julio","Thor"])

    name = each.key 
}