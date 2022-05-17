terraform {
required_providers {
    aws = {
    source  = "hashicorp/aws"
    version = "~> 3.27"
    }
  }
 required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "ap-southeast-1"
}

#resource "aws_iam_user" "new_user" {
#  name = "DemoUser"
#}

resource "aws_iam_user" "some_user" {
  name = "TestUser"
  path = "/"
}

#resource "aws_iam_group" "group" {
#    name = "Devops"
#    path = "/"
#}

resource "aws_iam_group_membership" "devops_group" {
  name  = "some_group-group-membership"
  users = ["${aws_iam_user.some_user.name}"]
  group = "Devops"
}

resource "aws_iam_group_membership" "devlead_group" {
  name  = "some_group-group-membership"
  users = ["${aws_iam_user.some_user.name}"]
  group = "DevLead"
}
