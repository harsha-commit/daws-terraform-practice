## Modules

- Similar to concept of variables and overriding
- Write main file
  - Write resource definition, variables, outputs as desired
  - Do not write provider config, because modules do not run code, they act as standard code
  - For optional variables, give empty value (can be overriden by module user)
- In test file
  - Create a module block and use source to point to main directory
  - Override desired variables (Required + Optional)
  - Catching outputs is done via outputs of module (not directly)
