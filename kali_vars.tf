

variable "AWS_REGION" {
    type = string 
    default = ""
}

variable "PATH_TO_PUBLIC_KEY" {
    description = "Public Key Path"
    default = "/path/to/kali_key.pub"
}

variable "PATH_TO_PRIVATE_KEY" {
    default = "/path/to/kali_key"
}

variable "kali_role_name" {
    type = string
    default = "kali-role"
}

variable "kali_role_policy" {
    type = string 
    default = "kali-role-policy"
}

variable "kali_instance_policy" {
    type = string
    default = "kali-instance-profile"
}

variable "key_name" {
    type = string
    default = ""
}

variable "instance_type" {
    type = string
    default = ""
}

variable "volume_size" {
    type = string
    default = ""
}

variable "volume_type" {
    type = string
    default = ""
}

variable "delete_on_termination" {
    type = bool
    default = true 
}

variable "instance_name" {
    type = string
    default = "kali-linux"
}

variable "egress_destination_cidr" {
    type = string
    default = "0.0.0.0/0"
}

variable "egress_source_cidr" {
    type = string
    default = "0.0.0.0/0"
}

variable "egress_rule_action" {
    type = string
    default = "accept"
}

variable "egress_traffic_direction" {
    type = string
    default = "egress"
}

variable "rule_number" {
    type = number
    default = 1
}

variable "ingress_destination_cidr" {
    type = string
    default = "0.0.0.0/0"
}

variable "ingress_source_cidr" {
    type = string
    default = "0.0.0.0/0"
}

variable "ingress_rule_action" {
    type = string
    default = "accept"
}

variable "ingress_traffic_direction" {
    type = string
    default = "ingress"
}

variable "source_eni" {
    type = string
    default = ""
}

variable "session_number" {
    type = number
    default = 1 
}


variable "kali_ports" {
    type = list(number)
    default = [22, 3389]
}

variable "mirror_source_ip" {
    type = string
    default = "mirror_source_ip/32"
}

variable "kali_sg_name" {
    type = string
    default = ""
}


