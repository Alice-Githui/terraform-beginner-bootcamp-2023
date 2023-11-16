output "bucket_name" {
  description="Bucket name for our static website"
  value=module.terrahouse_aws.bucket_name
}

output "s3_website_endpoint" {
  description = "S3 static website hosting endpoint"
  value= module.terrahouse_aws.website_endpoint
}

output "cloudfront_url" {
  description ="cloudfront url to access the website hosted on s3"
  value = module.terrahouse_aws.cloudfront_url
}