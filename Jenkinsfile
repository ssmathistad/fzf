pipeline {

   agent any

    environment {
    GITHUB_TOKEN = credentials('repo_use_token')
    PATH = "/working_dir/go/bin:/working_dir/bin/goreleaser:working_dir/bin:$PATH"
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
        sh 'curl -sL https://git.io/goreleaser | bash'
      }
    }
  }
}