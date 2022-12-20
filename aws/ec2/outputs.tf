output "instance_ip" {
  value       = aws_eip.eip[0].public_ip
  sensitive   = false
  description = "Publicly accessible IPv4 address of the EC2 instance."
}
