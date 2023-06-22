# The Traffic Mirror Filter
resource "aws_ec2_traffic_mirror_filter" "kali_filter" {
  description      = "Mirror filter for Kali Linux"
#  network_services = ["amazon-dns"]
}

# Traffic Mirror Filter Rules
resource "aws_ec2_traffic_mirror_filter_rule" "egress_kali_filter" {
  description              = "egress rule"
  traffic_mirror_filter_id = aws_ec2_traffic_mirror_filter.kali_filter.id
  destination_cidr_block   = "${var.egress_destination_cidr}"
  source_cidr_block        = "${var.egress_source_cidr}"
  rule_number              = var.rule_number
  rule_action              = "${var.egress_rule_action}"
  traffic_direction        = "${var.egress_traffic_direction}"
}

resource "aws_ec2_traffic_mirror_filter_rule" "ingress_kali_filter" {
  description              = "ingress rule"
  traffic_mirror_filter_id = aws_ec2_traffic_mirror_filter.kali_filter.id
  destination_cidr_block   = "${var.ingress_destination_cidr}"
  source_cidr_block        = "${var.ingress_source_cidr}"
  rule_number              = var.rule_number
  rule_action              = "${var.ingress_rule_action}"
  traffic_direction        = "${var.ingress_traffic_direction}"
}

# Traffic Mirror target. The kali instance eni is the target eni
resource "aws_ec2_traffic_mirror_target" "kali_target" {
  description          = "Kali Linux target"
  network_interface_id = "${aws_instance.kali-linux.primary_network_interface_id}"
}

# Traffic Mirror session. The eni of source instance is network_interface_id
resource "aws_ec2_traffic_mirror_session" "kali_mirror_session" {
  description              = "Kali Mirror Session"
#  network_interface_id     = aws_instance.*.primary_network_interface_id
  network_interface_id     = "${var.source_eni}"
  session_number           = var.session_number
  traffic_mirror_filter_id = aws_ec2_traffic_mirror_filter.kali_filter.id
  traffic_mirror_target_id = aws_ec2_traffic_mirror_target.kali_target.id
}
