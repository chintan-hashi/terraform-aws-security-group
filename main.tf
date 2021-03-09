##################################
# Get ID of created Security Group
##################################
locals {
  this_sg_id = concat(
    aws_security_group.this.*.id,
    aws_security_group.this_name_prefix.*.id,
    [""],
  )[0]
}


##########################
# Security group with name
##########################
resource "aws_security_group" "this" {

  name                   = var.name
  description            = var.description
  vpc_id                 = var.vpc_id

}

###################################
# Ingress - List of rules (simple)
###################################
# Security group rules with "cidr_blocks" and it uses list of rules names
resource "aws_security_group_rule" "ingress_rules" {
  count = var.create ? length(var.ingress_rules) : 0

  security_group_id = local.this_sg_id
  type              = "ingress"

  cidr_blocks      = var.ingress_cidr_blocks
  description      = var.rules[var.ingress_rules[count.index]][3]

  from_port = var.rules[var.ingress_rules[count.index]][0]
  to_port   = var.rules[var.ingress_rules[count.index]][1]
  protocol  = var.rules[var.ingress_rules[count.index]][2]
}

#################
# End of ingress
#################

##################################
# Egress - List of rules (simple)
##################################
# Security group rules with "cidr_blocks" and it uses list of rules names
#resource "aws_security_group_rule" "egress_rules" {
#  count = var.create ? length(var.egress_rules) : 0
#
#  security_group_id = local.this_sg_id
#  type              = "egress"
#
#  cidr_blocks      = var.egress_cidr_blocks
#  ipv6_cidr_blocks = var.egress_ipv6_cidr_blocks
#  prefix_list_ids  = var.egress_prefix_list_ids
#  description      = var.rules[var.egress_rules[count.index]][3]
#
#  from_port = var.rules[var.egress_rules[count.index]][0]
#  to_port   = var.rules[var.egress_rules[count.index]][1]
#  protocol  = var.rules[var.egress_rules[count.index]][2]
#}

################
# End of egress
################
