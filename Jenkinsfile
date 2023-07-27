pipeline 
{
    agent any
    environment {
       TF_VAR_aws_ami=""
    //    TF_VAR_aws_ami= credentials('AWS_AMI')
    }
    // parameters {
    //     string(name: 'AWS_AMI', defaultValue: 'xxx', description: 'aws ami image',)
    // }

    stages {

        stage('Fetch variables ') {
            steps {
                withCredentials([usernamePassword(credentialsId: '16a63e43-c96e-498d-858c-a68eb5329ad2', usernameVariable: 'MY_USERNAME', passwordVariable: 'MY_PASSWORD')]) {
                        // The 'your-credentials-id' should be replaced with the actual ID of your "Username and Password" credential in Jenkins.
                        // The 'MY_USERNAME' and 'MY_PASSWORD' environment variables will be automatically populated with the credential values.

                        // Print the fetched values to the console output
                        echo "Username: $MY_USERNAME"
                        echo "Password: $MY_PASSWORD"
                    }
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