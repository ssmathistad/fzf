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
                sh "git config --global user.email 'ssmathistad@mail.csuchico.edu'"
                sh "git config --global user.name 'ssmathistad'"
                sh "touch Jenkinsfile"
                sh "git commit"
                sh "git tag -a $params.VERSION -m $params.VERSIONMESSAGE"
                sh "git push origin $params.VERSION"
            }
        }
        
        stage('Deploy Go Releaser binaries') {
            steps {
                sh "goreleaser release"
            }
        }
    }
}