output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "public_subnet_id_another" {
  value = aws_subnet.public_subnet_another.id
}
