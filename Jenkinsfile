pipeline {
    agent any

    environment {
        GITHUB_TOKEN = credentials('github_token')
        PATH = "/working_dir/go/bin:$PATH"
    }

  stages {
    stage('Compile') {
      steps {
        git 'https://github.com/ssmathistad/fzf.git'
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