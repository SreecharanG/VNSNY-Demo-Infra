
# Terraform module to create Iam role on AWS for Lambda
data aws_iam_policy_document assume_role {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "role" {
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  name = var.name
}

resource "aws_iam_role_policy_attachment" "basic"{
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  role = aws_iam_role.role.name
}

resource "aws_iam_policy" "inline" {
  name        = var.inline_policy_name
  path        = "/"
  description = "My test policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1608504429748",
      "Action": [
        "dynamodb:GetItem",
        "dynamodb:PutItem"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:dynamodb:us-east-1:869588908060:table/VNSNY-DynamoDB-Table"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "additional" {
  policy_arn = aws_iam_policy.inline.arn
  role       = aws_iam_role.role.name
}

