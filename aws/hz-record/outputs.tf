output "record_fqdns" {
  value       = aws_route53_record.simple_records[*].fqdn
  description = "Fully qualified domain names of all the records created"
}
