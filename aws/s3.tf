resource "aws_s3_bucket" "data" {
  # bucket is public
  # bucket is not encrypted
  # bucket does not have access logs
  # bucket does not have versioning
  bucket        = "${local.resource_prefix.value}-data"
  acl           = "public-read"
  force_destroy = true
  tags = {
    Name                 = "${local.resource_prefix.value}-data"
    Environment          = local.resource_prefix.value
    yor_trace            = "0c23f4fd-6fd9-4ed1-925f-6c1b13388837"
    git_commit           = "10d94be64cc7e57ce75da94d7ba27e6a7fab56ef"
    git_file             = "aws/s3.tf"
    git_last_modified_at = "2023-03-07 03:01:25"
    git_last_modified_by = "gbrandyburg@paloaltonetworks.com"
    git_modifiers        = "gbrandyburg"
    git_org              = "adopt-guide-demos"
    git_repo             = "deployablegoat"
  }
}

resource "aws_s3_bucket" "financials" {
  # bucket is not encrypted
  # bucket does not have access logs
  # bucket does not have versioning
  bucket        = "${local.resource_prefix.value}-financials"
  acl           = "private"
  force_destroy = true
  tags = {
    Name                 = "${local.resource_prefix.value}-financials"
    Environment          = local.resource_prefix.value
    yor_trace            = "b1450859-3ab4-43db-b287-c19034fe0fbb"
    git_commit           = "10d94be64cc7e57ce75da94d7ba27e6a7fab56ef"
    git_file             = "aws/s3.tf"
    git_last_modified_at = "2023-03-07 03:01:25"
    git_last_modified_by = "gbrandyburg@paloaltonetworks.com"
    git_modifiers        = "gbrandyburg"
    git_org              = "adopt-guide-demos"
    git_repo             = "deployablegoat"
  }
}


resource "aws_s3_bucket" "financials_log_bucket" {
  bucket = "financials-log-bucket"
  tags = {
    git_commit           = "a6353eaede381614964096ce77f49e41565fc7c3"
    git_file             = "aws/s3.tf"
    git_last_modified_at = "2023-03-07 13:37:51"
    git_last_modified_by = "gbrandyburg@paloaltonetworks.com"
    git_modifiers        = "gbrandyburg"
    git_org              = "adopt-guide-demos"
    git_repo             = "deployablegoat"
    yor_trace            = "762b2951-5363-4d74-99ea-257388198f51"
  }
}

resource "aws_s3_bucket_logging" "financials" {
  bucket = aws_s3_bucket.financials.id

  target_bucket = aws_s3_bucket.financials_log_bucket.id
  target_prefix = "log/"
}




resource "aws_s3_bucket" "operations" {
  # bucket is not encrypted
  # bucket does not have access logs
  bucket = "${local.resource_prefix.value}-operations"
  acl    = "private"
  versioning {
    enabled = true
  }
  force_destroy = true
  tags = {
    Name                 = "${local.resource_prefix.value}-operations"
    Environment          = local.resource_prefix.value
    yor_trace            = "4534313c-6d0d-457d-b928-4c89689fb08a"
    git_commit           = "10d94be64cc7e57ce75da94d7ba27e6a7fab56ef"
    git_file             = "aws/s3.tf"
    git_last_modified_at = "2023-03-07 03:01:25"
    git_last_modified_by = "gbrandyburg@paloaltonetworks.com"
    git_modifiers        = "gbrandyburg"
    git_org              = "adopt-guide-demos"
    git_repo             = "deployablegoat"
  }

}