pipeline {

    agent any

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
      when {
        buildingTag()
      }

      environment {
        GITHUB_TOKEN = credentials('repo_use_token')
      }

      steps {
        sh 'curl -sL https://git.io/goreleaser | bash'
      }
    }
  }
}