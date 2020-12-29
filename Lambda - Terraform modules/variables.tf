variable "name" {
  type    = string
  default = "VNSNY-Lambda-DB-Role"
}

variable "inline_policy_name" {
  type    = string
  default = "DynamoDBReadWriteAccess"
}

variable "accesskeys" {
  type = string
}

variable "secretkeys" {
  type = string
}