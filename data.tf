data "terraform_remote_state" "vpc" {
  backend = "remote"
  
  config = {
    organization = "vivacitytech"
    workspaces = {
      name = "vpc-prod"
    }
  }
}