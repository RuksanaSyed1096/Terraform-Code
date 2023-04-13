variable "address_space" {
  description = "Vnet-Network-Ipaddress-cidr"
  type        = list(string)
  default = ["10.20.0.0/16"]
}

variable "address_prefixes" {
  description = "subnet-cidr"
  type        = list(string)
  default = ["10.20.1.0/24"]

}
variable "computer_name" {
  description = "windowsmachine-name"
  type        = string
  default     = "vmwindowsserver"

}
variable "admin_password" {
  description = "login password for windows machine"
  type        = string
  default     = "ruksana@1010"

}

variable "caching" {
  description = "caching type"
  type        = string
  default     = "ReadWrite"

}
