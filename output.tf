

output "instance_name" {
  value = aws_instance.vm[*].tags.Name
}

