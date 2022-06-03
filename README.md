# Networking last assignment Kevin Cardenas
Diagram of the vpc
![image](https://user-images.githubusercontent.com/38559573/171909767-bdb95ff0-5da4-4a1b-8a59-25a94deafc4c.png)
Table for the range and subnets
![image](https://user-images.githubusercontent.com/38559573/171911779-0499991e-2fc5-4d31-b8ed-2e5e7145dff9.png)

For the project to work you need to set up the key in key.tf with your public key and the name you want.
You need to have terraform install and aws configure with your credentials

After that in console create the plan:
```
terraform plan -out YourPlanName.tfplan
```
Then apply:
```
terraform apply
```
You should be able to see the 4 new EC2s, the VPC and subnets with their tag names,
if you want to connect to one of the EC2s with your key type in console:
```
ssh -i YourKey.pem ubuntu@IPNUMBER
```
