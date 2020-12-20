output "this_dynamodb_table_arn" {
  description = "ARN of the DynamoDB table"
  value       = element(concat(aws_dynamodb_table.basic_Dynamodb_table.*.arn, [""]), 0)
}

output "this_dynamodb_table_id" {
  description = "ID of the DynamoDB table"
  value       = element(concat(aws_dynamodb_table.basic_Dynamodb_table.*.id, [""]), 0)
}