# eks-terraform-jenkins-prometheus

### Deployed a jenkins server available http://18.170.99.242:8080/ user: duoarc password: admin 

### The deploy-to-eks job deploys a terraform script that builds the infrastructure defined in the terraform files. This builds a vpc, subnets, security groups and an Elastic Kubernetes Service cluster and NodeGroups that hosts my applications.

### The second stage of the  jenkins job creates a kubernetes namespace for the voting microservice app and deploys the voting app deployment http://voting-app.mabdulrahman.cloud/, the result app http://result-app.mabdulrahman.cloud/ and the redis db, postgres db and worker deployments that the voting app needs to work.

Next, the socks-app namespace is created and all the socks app microservice components are deployed therein. http://sock-app.mabdulrahman.cloud/

Lastly, monitoring and logging is covered by prometheus and Cloudwatch here
