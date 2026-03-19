variable "aws_region" {
  description = "La région AWS dans laquelle déployer les ressources"
  type        = string
  default     = "eu-west-3"  # Par défaut, la région est 'eu-west-3'
}

variable "instance_count" {
  description = "Le nombre d'instances à créer"
  type        = number
  default     = 1  # Par défaut, 1 instance sera créée. Modifiez selon vos besoins.
}

variable "instance_names" {
  description = "Les noms des instances à créer"
  type        = list(string)
  default     = ["Frontend", "Backend", "Database", "Monitoring", "Jenkins"]
}

variable "instance_ports" {
  description = "Ports à ouvrir par instance"
  type = map(list(object({
    port        = number
    protocol    = string
    description = string
  })))
  default = {
    "Frontend" = [
      { port = 22, protocol = "tcp", description = "SSH" },
      { port = 80, protocol = "tcp", description = "HTTP" },
      { port = 443, protocol = "tcp", description = "HTTPS" }
    ]
    "Backend" = [
      { port = 22, protocol = "tcp", description = "SSH" },
      { port = 9000, protocol = "tcp", description = "PHP-FPM" },
      { port = 6379, protocol = "tcp", description = "Redis" }
    ]
    "Database" = [
      { port = 22, protocol = "tcp", description = "SSH" },
      { port = 3306, protocol = "tcp", description = "MySQL" }
    ]
    "Monitoring" = [
      { port = 22, protocol = "tcp", description = "SSH" },
      { port = 80, protocol = "tcp", description = "Zabbix Web" },
      { port = 3000, protocol = "tcp", description = "Grafana" },
      { port = 10051, protocol = "tcp", description = "Zabbix Server" }
    ]
    "Jenkins" = [
      { port = 22, protocol = "tcp", description = "SSH" },
      { port = 8080, protocol = "tcp", description = "Jenkins Web" },
      { port = 9000, protocol = "tcp", description = "SonarQube" },
      { port = 50000, protocol = "tcp", description = "Jenkins Agent" }
    ]
  }
}
