output "this_security_group_id" {
  description = "The ID of the security group"
  value = aws_security_group.this.*.id
}

output "this_security_group_vpc_id" {
  description = "The VPC ID"
  value = aws_security_group.this.*.vpc_id
}

output "this_security_group_name" {
  description = "The name of the security group"
  value = aws_security_group.this.*.name
}

output "this_security_group_description" {
  description = "The description of the security group"
  value = aws_security_group.this.*.description
}

//output "this_security_group_ingress" {
//  description = "The ingress rules"
//  value       = "${element(concat(aws_security_group.this.*.ingress, list("")), 0)}"
//}
//output "this_security_group_egress" {
//  description = "The egress rules"
//    value       = "${element(concat(aws_security_group.this.*.egress, list("")), 0)"
//}
