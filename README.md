#tfe-demo-application42

This repo is here to demonstrate abstracting Terraform Enterprise private registry modules into a completely different workspace.   The intent is to demonstrate the fact that most deployers aren't the module creators and should just use re-usable elements when possible.   

## Deploy instructions
 * Ensure you've deploy https://github.com/grove-mountain/terraform-aws-ec2-instance.git as a private registry 
 * set $private-repo-source. This will be the locate displayed after the registry is made
 * set $private-repo-version   
 * Create a new module workspace in your organization referencing this repo
 * Profit
