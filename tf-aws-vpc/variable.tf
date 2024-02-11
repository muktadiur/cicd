variable "vpc-cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public-subnet-1-cidr" {
  description = "The CIDR blocks for the public subnet 1"
  type        = string
  default     = "10.0.0.0/24"
}

variable "public-subnet-2-cidr" {
  description = "The CIDR blocks for the public subnet 2"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private-subnet-1-cidr" {
  description = "The CIDR blocks for the private subnet 1"
  type        = string
  default     = "10.0.2.0/24"
}

variable "private-subnet-2-cidr" {
  description = "The CIDR blocks for the private subnet 2"
  type        = string
  default     = "10.0.3.0/24"
}

variable "private-subnet-3-cidr" {
  description = "The CIDR blocks for the private subnet 3"
  type        = string
  default     = "10.0.4.0/24"
}

variable "private-subnet-4-cidr" {
  description = "The CIDR blocks for the private subnet 4"
  type        = string
  default     = "10.0.5.0/24"
} 

variable "availability-zone-1" {
  description = "The availability zone 1 for the VPC"
  type        = string
  default     = "us-east-1a"
}


variable "availability-zone-2" {
  description = "The availability zone 2 for the VPC"
  type        = string
  default     = "us-east-1b"
}
