pipeline {
    agent any

    stages {
        stage('checkout') {
          steps {
            script{
                dir("terraform")
                    {
                        git "https://github.com/pavanprabhu83/jenkins-terraform-demo.git"
                    }
                }
            }
        }

  }
}
