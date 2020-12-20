




module "lambda-basic-execution-role" {
  source  = "amancevice/lambda-basic-execution-role/aws"
  version = "0.1.0"
  # insert the 1 required variable here
}

# Terraform module to create Iam role on AWS for Lambda
resource "aws_iam_role" "default" {
  count = var.enabled ? 1 : 0
  name  = format("%s-role", module.labels.id)

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}
