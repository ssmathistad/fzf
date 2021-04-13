pipeline {

  agent any

  environment {
    GITHUB_TOKEN = credentials('repo_use_token')
    PATH = "$PATH:/usr/local/go/bin"
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
        branch 'master'
      }
      steps {
        sh 'goreleaser release --rm-dist'
      }
    }
  }
}
