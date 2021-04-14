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
    
        // Checks if there's a tag(s) against HEAD and builds a tag if there isn't. Pass in the tag name as an argument.
        sh "./tagBuilder.sh v0.32.${BUILD_NUMBER}"
    
        when {
            branch 'master'
            tag "v*.*.*"
        }
    
        // Pushes tag created by tagBuilder.sh
        withCredentials([usernamePassword(credentialsId: 'github_token', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
        sh "git config --global user.name ssmathistad"
        sh "git config --global user.email ssmathistad@mail.csuchico.edu"
        sh("git push https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/${GIT_USERNAME}/fzf.git --tags");
        }

        sh 'goreleaser release --rm-dist'

    }
  }
}
