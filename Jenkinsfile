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
                //sh "git config --global user.email 'ssmathistad@mail.csuchico.edu'"
                //sh "git config --global user.name 'ssmathistad'"
                //sh "git config --global user.email \"ssmathistad@mail.csuchico.edu\""
                //sh "git config --global user.name \"ssmathistad\""
                //sh "touch Jenkinsfile"
                //sh "git commit"
                //sh "git tag -a $params.VERSION -m $params.VERSIONMESSAGE"

                withCredentials([usernamePassword(credentialsId: 'github_token', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
                    //sh("git tag -a some_tag -m 'Jenkins'")
                    sh "git tag -a $params.VERSION -m \"$params.VERSIONMESSAGE\""
                    //sh('git push https://${GIT_USERNAME}:${GIT_PASSWORD}@<REPO> --tags')
                    sh "git push https://${GIT_USERNAME}:${GIT_PASSWORD}@https://github.com/ssmathistad/fzf.git $params.VERSION"
                }

                ////sh "git tag -a $params.VERSION -m \"$params.VERSIONMESSAGE\""
                //sh "git remote add origin git@github.com:ssmathistad/fzf.git"
                ////sh "git push origin master $params.VERSION"
            }
        }
        
        stage('Deploy Go Releaser binaries') {
            steps {
                sh "goreleaser release"
            }
        }
    }
}