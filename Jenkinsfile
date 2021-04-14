//def headcommit = true

//GIT_COMMIT

pipeline {

  agent any

  environment {
    GITHUB_TOKEN = credentials('repo_use_token')
    PATH = "$PATH:/usr/local/go/bin" // gopath
    //headcommit = true
  }

  stages {
    stage('Compile') {
      steps {
         withCredentials([usernamePassword(credentialsId: 'github_token', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
            sh "git config --global user.name ssmathistad"
            sh "git config --global user.email ssmathistad@mail.csuchico.edu"
            sh "git fetch --all --tags"
            sh "git tag --points-at HEAD"
        }
        sh 'go build'
      }
    }

    stage('Test') {
      steps {
        sh 'go test ./...'
      }
    }
    
    //def tag = sh(returnStdout: false, script: "git tag --contains | head -1").trim()
    //if (!tag) {

      
      stage ('Release') {
        when {
          branch 'master'
          //env.headcommit 'false'
          //headcommit false
          tag "v*.*.*"
        }


        steps {
           withCredentials([usernamePassword(credentialsId: 'github_token', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
              sh "git config --global user.name ssmathistad"
              sh "git config --global user.email ssmathistad@mail.csuchico.edu"
              sh "git tag v0.32.${BUILD_NUMBER}"
              sh("git push https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/${GIT_USERNAME}/fzf.git --tags");
          }

          sh 'goreleaser release --rm-dist'
        }

      }


    }
  }
}
