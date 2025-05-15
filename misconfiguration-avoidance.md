# Avoiding Misconfigurations in Terraform AWS Setup  

## Security Enhancements  
- Restricted SSH Access → Allowed only your IP to reduce exposure.  
- IAM Role Instead of Access Keys → Prevented hardcoded credentials.  
- S3 Bucket Public Access Block → Ensured sensitive data isn’t exposed.  

## Networking Best Practices  
- Used Private Subnets for Internal Services → Kept instances isolated.  
- Attached NAT Gateway for Outbound Traffic → Allowed private instances to access the internet securely.  
- Validated Route Tables → Ensured proper routing between public & private instances.  

## Terraform Best Practices  
- Modular Configuration → Split infrastructure into reusable components.  
- State File Security → Ensured state file isn’t exposed publicly.  
- Used Versioning for S3 → Prevented accidental data loss.  

## Lessons Learned  
By following these steps, I successfully deployed a secure AWS infrastructure and avoided common misconfigurations. This documentation ensures repeatability and scalability for future projects.  
