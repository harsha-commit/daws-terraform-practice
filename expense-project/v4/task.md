## Note

- Destroy all resources after completion

## Concepts Covered

- Remote State
- For Loop
  - Note how output of resources change when used for loop instead of count
  - Hint: Type - Map for For loop, List for Count
- Dynamic Blocks

## Tasks

- Implement remote state
- Replace count logic with for_each (each.key, each.value for map)
  - Use the output of ec2 resources (as map) to loop in r53
- Implement dynamic blocks for security group for allowing multiple ports
