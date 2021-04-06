pipeline {
    agent any
    
    parameters {
        string(name: 'VERSION', defaultValue: 'v0.26')
        string(name: 'VERSIONMESSAGE', defaultValue: 'Bumping version')
    }

    environment {
        GITHUB_TOKEN = credentials('repo_use_token')
    }

    stages {
        stage('Git') {
            steps {
                // Get some code from a GitHub repository
                git 'https://github.com/ssmathistad/fzf.git'
            }
        }
        
        stage('Go Releaser tag creation') {
            steps {
                //withCredentials([usernamePassword(credentialsId: 'github_token', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
                withCredentials([usernamePassword(git credentialsId: 'github_token', url: 'https://github.com/ssmathistad/fzf.git')]) {
                    sh "git tag -a $params.VERSION -m \"$params.VERSIONMESSAGE\""
                    //sh "git push https://${GIT_USERNAME}:${GIT_PASSWORD}@https://github.com/ssmathistad/fzf.git $params.VERSION"
                    sh "git push"
                }
            }
        }
        
        stage('Deploy Go Releaser binaries') {
            steps {
                sh "goreleaser release"
            }
        }
    }
}