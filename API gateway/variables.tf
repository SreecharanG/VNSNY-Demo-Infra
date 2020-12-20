
variable "enabled" {
  type = bool
  default = true
  description = "Whether to creaet rest api"
}

# Variables for "aws_api_gateway_rest_api"

variable "name" {
    type = string
    default = "VNSNY-API-Gateway" 
}

variable "binary_media_types" {
    type = list
    default = ["UTF-8-encoded"]
    description = "The list of binary media types supported by REST API. By Default it takes UTF-8-encoded"
}

variable "minimum_compression_size" {
    type = number
    default = -1 
    description = "Minimum response size to compress for REST API. Integer between -1 and 10MB(10485760). Setting greater than -1 will enable it, -1 disables compression (default)"
}

variable "api_key_source" {
    type = string
    default = "HEADER"
    description = "The source of API key for requests, valid values are HEADER(default) and AUTHORIZER"
}

variable "type" {
    type = list
    default = ["EDGE"]
    description = "Whether to create REST api"
}

# Variables for "aws_api_gateway_resource"

variable "path_parts" {
    type = list
    default = ["GetMySchedule"]
    description = "The last path segment of this API resource"
}


# variables accesskeys 

variable "accesskeys" {
  type = string
}
variable "secretkeys" {
  type = string
}

