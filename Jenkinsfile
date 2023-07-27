pipeline 
{
    agent any
    environment {
       TF_VAR_aws_ami="${AWS_AMI}"
    //    TF_VAR_aws_ami= credentials('AWS_AMI')
    }
    // parameters {
    //     string(name: 'AWS_AMI', defaultValue: 'xxx', description: 'aws ami image',)
    // }

    stages {
        stage('Fetch variables ') {
            steps {
                withCredentials([
                [$class: 'AmazonWebServicesCredentialsBinding',
                credentialsId: '16a63e43-c96e-498d-858c-a68eb5329ad2',
                AWS_AMI: 'AWS_AMI'
        ])
                script {
                        echo $TF_VAR_aws_ami
                    }
                // }
            }
        }
        stage('Test variables') {
            steps {
                    sh """
                    echo $TF_VAR_aws_ami
                    """
            }
        }
    }
}