pipeline 
{
    agent any
    environment {
        TF_VAR_aws_access_key = credentials('aws_access_key')
        TF_VAR_aws_secret_key = credentials('aws_secret_key')
        // TF_VAR_AWS_AMI="${AWS_AMI}"
        TF_VAR_EC2_Instance_Type="${EC2_Instance_Type}"
        TF_VAR_project="${project}"
        TF_VAR_AWS_Region="${AWS_Region}"
        TF_VAR_VPC_CIDR="${VPC_CIDR}"
        TF_VAR_Public_Subnet_CIDR="${Public_Subnet_CIDR}"
        TF_VAR_Private_Subnet_CIDR="${Private_Subnet_CIDR}"
        TF_VAR_Public_Instance_Count="${Public_Instance_Count}"
        TF_VAR_Private_Instance_Count="${Private_Instance_Count}"
        // TF_VAR_Public_Instance_Name="${Public_Instance_Name}"
        // TF_VAR_Private_Instance_Name="${Private_Instance_Name}"
    }

     parameters {
        // string(name: 'AWS_AMI', defaultValue: 'ami-0557a15b87f6559cf', description: 'AMI setup',)
        string(name: 'EC2_Instance_Type', defaultValue: 't2.micro', description: 'EC2 instance type',)
        string(name: 'AWS_Region', defaultValue: 'us-east-1', description: 'AWS region where VPC will be present',)
        string(name: 'VPC_CIDR', defaultValue: '10.0.0.0/16', description: 'AWS vpc cidr',)
        string(name: 'Public_Subnet_CIDR', defaultValue: '10.0.1.0/24', description: 'AWS public subnet cidr',)
        string(name: 'Private_Subnet_CIDR', defaultValue: '10.0.2.0/24', description: 'AWS private subnet cidr',)
        string(name: 'Public_Instance_Count', defaultValue: '1', description: 'Count of public instances to be deployed',)
        string(name: 'Private_Instance_Count', defaultValue: '1', description: 'Count of private instances to be deployed',)
        string(name: 'project', defaultValue: 'test', description: 'Name of terraform project',)
        choice(name: 'action', description: '', choices: ['plan','apply' , 'destroy'])
        // extendedChoice( 
        //     name: 'Public_Instance_Name', 
        //     defaultValue: 'jenkins-master,build-server', 
        //     description: 'Names of public instances', 
        //     type: 'PT_CHECKBOX',
        //     multiSelectDelimiter: ',',
        //     value:'jenkins-master,build-server', 
        //     visibleItemCount: 10
        // )
        // extendedChoice( 
        //     name: 'Private_Instance_Name', 
        //     defaultValue: 'ansible-server', 
        //     description: 'Names of private instances', 
        //     type: 'PT_CHECKBOX',
        //     multiSelectDelimiter: ',',
        //     value:'ansible-server-1,ansible-server-2', 
        //     visibleItemCount: 10
        // )
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
        stage("Terraform Setup/init"){
            steps {
                sh '''
                terraform init -reconfigure -backend-config="access_key=$TF_VAR_aws_access_key" -backend-config="secret_key=$TF_VAR_aws_secret_key"
                '''
            }
        }
        stage("Terraform dry-run"){
            steps{                  
                sh '''
                echo "AWS Instance Type --> "$TF_VAR_EC2_Instance_Type
                echo "Project Name --> "$TF_VAR_project
                echo "AWS Region --> "$TF_VAR_AWS_Region
                echo "AWS VPC CIDR --> "$TF_VAR_VPC_CIDR
                echo "Public Subnet CIDR --> "$TF_VAR_Public_Subnet_CIDR
                echo "Private Subnet CIDR --> "$TF_VAR_Private_Subnet_CIDR
                echo "Instances in Public Subnet --> "$TF_VAR_Public_Instance_Count
                echo "Instances in Private Subnet --> "$TF_VAR_Private_Instance_Count
                terraform plan -var="aws_access_key=$TF_VAR_aws_access_key" -var="aws_secret_key=$TF_VAR_aws_secret_key"
                 '''
            }
        }
        stage("Terraform Action"){
            steps{
                sh '''
                if [ $action = "plan" ]; then
                    terraform plan -var="aws_access_key=$TF_VAR_aws_access_key" -var="aws_secret_key=$TF_VAR_aws_secret_key"
                else
                    terraform ${action} --auto-approve -var="aws_access_key=$TF_VAR_aws_access_key" -var="aws_secret_key=$TF_VAR_aws_secret_key"
                fi
                '''
            }
        }

    }
}