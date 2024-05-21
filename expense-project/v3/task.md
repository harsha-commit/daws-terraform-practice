## Note

- Destroy all resources after completion

## Concepts Covered

- Extracting data from Output and using it
- String Interpolation
- Locals

## Tasks

- Modify the v2 code by:
  - Create Route53 Resource
    - Use locals for route53 resource, instead of variables
    - Give public ip address for frontend, else give private ip address
    - Give record name corresponding to each ec2 resource
    - Attributes of a resource can be extracted from output
    - Use string interpolation when an expression is combined with string
  - Use data source for fetching AMI ID, Hosted Zone ID and VPC ID of default VPC
  - Use `allow_overwrite=true` in route53 if the route record is already present
