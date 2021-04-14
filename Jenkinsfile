pipeline {

  agent any

  environment {
    GITHUB_TOKEN = credentials('repo_use_token')
    PATH = "$PATH:/usr/local/go/bin" // gopath
  }

  stages {
    stage('Compile') {
      steps {
         withCredentials([usernamePassword(credentialsId: 'github_token', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
            sh "git config --global user.name ssmathistad"
            sh "git config --global user.email ssmathistad@mail.csuchico.edu"
            sh "git fetch --all --tags"
        }
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
        //tag "v*.*.*"
        //buildingTag()
      }
      steps {
        sh 'goreleaser release --rm-dist'
      }
    }
  }
}
