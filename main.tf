##################################
# Get ID of created Security Group
##################################
locals {
  this_sg_id = aws_security_group.this.*.id
}


##########################
# Security group with name
##########################
resource "aws_security_group" "this" {

  name                   = var.name
  description            = var.description
  vpc_id                 = var.vpc_id

  ingress {
    description = var.rule_description
    from_port   = var.from_port
    to_port     = var.to_port
    protocol    = var.protocol
    cidr_blocks = var.cidr_block
  }

}
