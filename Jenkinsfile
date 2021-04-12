pipeline {

   agent any

    environment {
    GITHUB_TOKEN = credentials('repo_use_token')
    }

  stages {
    stage('Compile') {
      steps {
        sh 'go build'
      }
    }

    stage('Test') {
      steps {
        sh 'go test ./...'
      }
    }

    stage ('Release') {

      steps {
        sh 'curl -sL https://git.io/goreleaser | sh'
      }
    }
  }
}
