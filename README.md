### Architecture diagram 
![Screen Shot 2024-01-21 at 2 15 39](https://github.com/NikDzub/terraform_vpc/assets/87159434/f3713c48-3c7e-4804-a708-1eb7ea9b7c68)
![Screen Shot 2024-01-17 at 21 51 22](https://github.com/NikDzub/terraform_vpc/assets/87159434/0e8f4aa1-967c-46bd-9d19-e7b7d31ddb74)
```bash
cd environments/development
```
```bash
terraform init && terraform apply -auto-approve
```
### Notes
1. ELB v2/RDS/Auto Scaling is supported by LocalStack only in the pro version.
so I commented those modules to apply w/o any errors.
