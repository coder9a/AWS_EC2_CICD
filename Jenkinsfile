pipeline 
{
    agent any
    environment {
        TF_VAR_access_key = credentials('access_key')
        TF_VAR_secret_key = credentials('secret_key')
    }

     parameters {
        string(name: 'AWS_AMI', defaultValue: 'ami-0557a15b87f6559cf', description: 'AMI setup',)
        string(name: 'EC2_Instance_Type', defaultValue: 't2.micro', description: 'EC2 instance type',)
        string(name: 'EC2_Instance_Name', defaultValue: 'ec2-nginx', description: 'EC2 instance name',)
        string(name: 'AWS_Region', defaultValue: 'us-east-1', description: 'AWS region where VPC will be present',)
        string(name: 'VPC_CIDR', defaultValue: '10.0.0.0/16', description: 'AWS vpc cidr',)
        string(name: 'Public_Subnet_CIDR', defaultValue: '10.0.1.0/24', description: 'AWS public subnet cidr',)
        string(name: 'Private_Subnet_CIDR', defaultValue: '10.0.2.0/24', description: 'AWS private subnet cidr',)
        number(name: 'Private_Instance_Count', defaultValue: '1', description: 'Count of private instances to be deployed',)
        choice(name: 'action', description: '', choices: ['apply' , 'destroy'])
    }
    stages {
        stage("terraform setup"){
            steps{
                 sh """
                    echo "key 1 >>> $ami_linux"
                    echo "key 2 >>> $ec2_instance_type1"
                    echo "key 3 >>> $key_name"
                    echo "key 4 >>> $ec2_instance_name"
                    echo "key 5 >>> $action"
                    echo "key 6 >>> $AWS_ACCESS_KEY"
                    """
                }
            }
    }
}