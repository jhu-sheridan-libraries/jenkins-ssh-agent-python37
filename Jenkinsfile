pipeline {
  agent { label "docker" }

  environment {
    tag = VersionNumber (versionNumberString: '${BUILD_DATE_FORMATTED, "yyyyMMdd"}-${BUILD_ID}')
    customImage = ''
    repository = 'jhulibraries/jenkins-ssh-agent-python37'
  }
      
  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }
    
    stage('Build') {
      steps {
        script {
          customImage = docker.build("${repository}:${tag}")
        }
      }
    }
    
    stage('Deploy') {
      steps {
        script {
          docker.withRegistry('', 'dockerhub') {
            customImage.push()
            customImage.push("latest")
          }
        }
      }
    }
  }
  post {
    always {
      sh('docker system prune -a --force')
    }
  }
}