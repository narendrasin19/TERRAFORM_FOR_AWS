# Define a DB subnet group for RDS
resource "aws_db_subnet_group" "mariadb-subnets" {
  name        = "mariadb-subnets"                             # Name of the DB subnet group
  description = "Amazon RDS subnet group"                     # Description of the DB subnet group
  subnet_ids  = [aws_subnet.levelupvpc-private-1.id, aws_subnet.levelupvpc-private-2.id] # List of subnets for RDS
}

# Define a parameter group for RDS MariaDB
resource "aws_db_parameter_group" "levelup-mariadb-parameters" {
  name        = "levelup-mariadb-parameters"                  # Name of the parameter group
  family      = "mariadb10.4"                                 # Database family version
  description = "MariaDB parameter group"                     # Description of the parameter group

  parameter {
    name  = "max_allowed_packet"                              # Parameter for MariaDB
    value = "16777216"                                        # Value for max allowed packet size
  }
}

# Define the RDS instance properties
resource "aws_db_instance" "levelup-mariadb" {
  allocated_storage       = 20                                # Storage allocated (20 GB)
  engine                  = "mariadb"                         # Database engine
  engine_version          = "10.4.34"                         # Engine version
  instance_class          = "db.t3.micro"                     # Instance class
  identifier              = "mariadb-instance"                # Unique identifier for the DB instance
  username                = "root"                            # Master username for the DB
  password                = "mariadb141"                      # Master password for the DB (secure this properly)
  db_subnet_group_name    = aws_db_subnet_group.mariadb-subnets.name  # Subnet group
  parameter_group_name    = aws_db_parameter_group.levelup-mariadb-parameters.name  # Parameter group
  multi_az                = false                             # Multi-AZ deployment (high availability)
  vpc_security_group_ids  = [aws_security_group.allow-mariadb.id] # Security group
  storage_type            = "gp2"                             # General purpose SSD storage
  backup_retention_period = 30                                # Backup retention period (in days)
  availability_zone       = aws_subnet.levelupvpc-private-1.availability_zone # Preferred availability zone
  skip_final_snapshot     = true                              # Skip final snapshot on deletion

  tags = {
    Name = "levelup-mariadb"                                  # Tag for identifying the resource
  }
}
