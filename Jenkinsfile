pipeline 
{
    agent any
    environment {
        TF_VAR_access_key = credentials('aws_access_key')
        TF_VAR_secret_key = credentials('aws_secret_key')
    }

     parameters {
        string(name: 'AWS_AMI', defaultValue: 'ami-0557a15b87f6559cf', description: 'AMI setup',)
        string(name: 'EC2_Instance_Type', defaultValue: 't2.micro', description: 'EC2 instance type',)
        string(name: 'EC2_Instance_Name', defaultValue: 'ec2-nginx', description: 'EC2 instance name',)
        string(name: 'AWS_Region', defaultValue: 'us-east-1', description: 'AWS region where VPC will be present',)
        string(name: 'VPC_CIDR', defaultValue: '10.0.0.0/16', description: 'AWS vpc cidr',)
        string(name: 'Public_Subnet_CIDR', defaultValue: '10.0.1.0/24', description: 'AWS public subnet cidr',)
        string(name: 'Private_Subnet_CIDR', defaultValue: '10.0.2.0/24', description: 'AWS private subnet cidr',)
        string(name: 'Private_Instance_Count', defaultValue: '1', description: 'Count of private instances to be deployed',)
        choice(name: 'action', description: '', choices: ['apply' , 'destroy'])
    }
    stages {
        // stage("Jenkins setup"){
        //     steps {
        //         script {
        //             currentBuild.displayName = "${EC2_Instance_Type}-${action}"
        //             currentBuild.description = "Job for provising : ${EC2_Instance_Type}"
        //         }
        //     }
        // }
        stage("Terraform Setup"){
            steps {
                checkout scm
            }
        }
        stage("ENV Provisioning"){
            steps {
                sh """
                export TF_VAR_AWS_AMI=${AWS_AMI}
                export TF_VAR_EC2_Instance_Type=${EC2_Instance_Type}
                export TF_VAR_EC2_Instance_Name=${EC2_Instance_Name}
                export TF_VAR_AWS_Region=${AWS_Region}
                export TF_VAR_VPC_CIDR=${VPC_CIDR}
                export TF_VAR_Public_Subnet_CIDR=${Public_Subnet_CIDR}
                export TF_VAR_Private_Subnet_CIDR=${Private_Subnet_CIDR}
                export TF_VAR_Private_Instance_Count=${Private_Instance_Count}
                """
            }
        }
        stage("Terraform setup/init"){
            steps {
                sh '''
                export TF_VAR_access_key=credentials('aws_access_key')
                export TF_VAR_secret_key=credentials('aws_secret_key')
                terraform init -reconfigure
                '''  
            }
        }
        // stage("terraform action"){

        // }

    }
}