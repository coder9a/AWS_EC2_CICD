pipeline 
{
    agent any
    environment {
         TF_VAR_access_key="${access_key}"
        TF_VAR_secret_key="${secret_key}"
    }
    // parameters {
    //     string(name: 'AWS_AMI', defaultValue: 'xxx', description: 'aws ami image',)
    // }

    stages {

        stage('Fetch variables ') {
            steps {
                withCredentials([usernamePassword(credentialsId: '16a63e43-c96e-498d-858c-a68eb5329ad2', usernameVariable: 'ACCESS_KEY', passwordVariable: 'SECRET_KEY')]) 
                {
                 script {
                    echo "Username: $ACCESS_KEY"
                    echo "pwd: $SECRET_KEY"
                }
            }
        }
        
        // stage('Test variables') {
        //     steps {
        //             sh """
        //             echo "Username: $TF_VAR_aws_ami_id"withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: '16a63e43-c96e-498d-858c-a68eb5329ad2',ACCESS_KEY: 'ACCESS_KEY', SECRET_KEY: 'ACCESS_KEY']])
            
        //             echo "pwd: $TF_VAR_aws_ami_key"
        //             """
        //     }
        // }
        }
    }
}