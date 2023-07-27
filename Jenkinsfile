pipeline 
{
    agent any
    environment {
        TF_VAR_aws_ami_id=""
        TF_VAR_aws_ami_key=""
    //    TF_VAR_aws_ami= credentials('16a63e43-c96e-498d-858c-a68eb5329ad2')
    }
    // parameters {
    //     string(name: 'AWS_AMI', defaultValue: 'xxx', description: 'aws ami image',)
    // }

    stages {

        stage('Fetch variables ') {
            steps {
                withCredentials([usernamePassword(credentialsId: '16a63e43-c96e-498d-858c-a68eb5329ad2', usernameVariable: 'TF_VAR_aws_ami_id', passwordVariable: 'TF_VAR_aws_ami_key')]) {
                    echo "Username: $TF_VAR_aws_ami_id"
                    echo "pwd: $TF_VAR_aws_ami_key"
                    echo $class
                    // echo "Password: $MY_PASSWORD"
                }
            }
        }
        stage('Test variables') {
            steps {
                    sh """
                    echo "Username: $TF_VAR_aws_ami_id"
                    echo "pwd: $TF_VAR_aws_ami_key"
                    """
            }
        }
    }
}