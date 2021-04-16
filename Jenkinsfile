pipeline {

  agent any

  environment {
    GITHUB_TOKEN = credentials('repo_use_token') // GitHub token
    PATH = "$PATH:/usr/local/go/bin" // Go path
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
      when {
        buildingTag()
      }
      steps {
        sh 'goreleaser release --rm-dist'
      }
    }
  }
}
