- Create Multiple Environments using

  - tfvars
  - workspaces
  - Expected Naming Convention
    - db-dev, backend-dev, frontend-dev
    - db-prod, backend-prod, frontend-dev
    - db-dev.harshadevops.online
    - backend-dev.harshadevops.online
    - frontend-dev.harshadevops.online
    - db-prod.harshadevops.online
    - backend-prod.harshadevops.online
    - harshadevops.online

- Store Private IP Addresses of EC2 Instances in a file using Provisioners

  - Use local_exec to get the addresses
  - Use remote_exec

- Provisioners only run at creation time
