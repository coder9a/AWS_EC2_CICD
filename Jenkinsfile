pipeline 
{
    agent any
    environment {
        AWS_ACCESS_KEY = credentials('TF_VAR_new_key') 
    }

     parameters {
        string(name: 'ami_linux', defaultValue: 'ami-0557a15b87f6559cf', description: 'AMI setup',)
        string(name: 'ec2_instance_type1', defaultValue: 't2.micro', description: 'ec2 instance type',)
        string(name: 'key_name', defaultValue: 'ec2-instance-tf', description: 'ssh key name',)
        string(name: 'ec2_instance_name', defaultValue: 'ec2-nginx', description: 'EC2 instance name',)
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