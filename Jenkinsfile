pipeline {
    agent any


    stages {
        stage('checkout') {
            steps {
                 script{
                        dir("Terraform")
                        {
                            git clone "https://github.com/pavanprabhu83/jenkins-terraform-demo.git"
                        }
                    }
                }
            }
  }
}
