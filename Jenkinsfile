pipeline {
    agent any

    stages {
        stage('checkout') {
          steps {
            script{
                dir("terraform")
                    {
                        git branch: 'main', changelog: false, poll: false, url: 'https://github.com/pavanprabhu83/jenkins-terraform-demo.git'
                    }
                }
            }
        }

  }
}
