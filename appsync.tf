
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

resource "aws_appsync_graphql_api" "example" {
  name          = "example-appsync-api"
  authentication_type = "API_KEY"
  
  schema = <<EOF
type Query {
  hello: String
}
EOF
}

resource "aws_appsync_api_key" "example_api_key" {
  api_id = aws_appsync_graphql_api.example.id
}

output "appsync_api_url" {
  value = aws_appsync_graphql_api.example.uris["GRAPHQL"]
}

output "appsync_api_key" {
  value     = aws_appsync_api_key.example_api_key.key
  sensitive = true
}
