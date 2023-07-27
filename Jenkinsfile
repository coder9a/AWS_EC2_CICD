pipeline 
{
    agent any
    environment {
       TF_VAR_aws_ami="${AWS_AMI}"
    }
    // parameters {
    //     string(name: 'AWS_AMI', defaultValue: 'xxx', description: 'aws ami image',)
    // }

    stages {
        stage('Test variables') {
            steps {
                    sh """
                    echo $TF_VAR_aws_ami
                    """
            }
        }
    }
}