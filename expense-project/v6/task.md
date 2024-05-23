## Using Modules

- Create VPC
- Create and Attach three subnets "public", "private" and "db" in 2 AZs
- Create and Attach IGW to VPC
- Create route table for each subnet and attach to subnets
  - Public points to 0.0.0.0/o via IGW
- Create NAT Gateway in Public subnet (one subnet is enough for demo), Attach Elastic IP

- Get all AZs in a region (Region is taken from provider.tf)
  - https://stackoverflow.com/questions/72590536/how-to-display-all-availability-zone-in-terrafor-output
