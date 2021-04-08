pipeline {
    agent any
    
    //parameters {
    //    string(name: 'VERSION', defaultValue: 'v0.26')
    //    string(name: 'VERSIONMESSAGE', defaultValue: 'Bumping version')
    //}

    environment {
        GITHUB_TOKEN = credentials('repo_use_token')
        PATH = "/working_dir/go/bin:$PATH"
    }

    stages {
        //stage('Git') {
            //steps {
                // Get some code from a GitHub repository
                //git 'https://github.com/ssmathistad/fzf.git'
                //git credentialsId: 'github_pw', url: 'git@github.com:ssmathistad/fzf.git'
                //git credentialsId: 'github_token', url: 'https://github.com/ssmathistad/fzf.git'
            //}
        //}

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
        
        stage('Go Releaser tag creation') {
            //steps {
                //when {
                //    buildingTag()
                //}
                environment {
                    GITHUB_TOKEN = credentials('repo_use_token')
                }
                steps {

                    withCredentials([usernamePassword(credentialsId: 'github_token', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
                        sh "git config --global user.name ssmathistad"
                        sh "git config --global user.email ssmathistad@mail.csuchico.edu"
                        //sh "git config --list --show-origin"
                        sh("git tag -a v0.26.${BUILD_NUMBER} -m \"Version Bumped\"")
                        sh("git show")
                        //sh('git push origin https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/ssmathistad/fzf.git --tags')
                        //sh("git push origin v0.26.${BUILD_NUMBER} https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/ssmathistad/fzf.git")
                        sh("git push https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/ssmathistad/fzf.git --tags")
                        //sh("git fetch --tags")
                        //sh("git show")
                        //sh 'curl -sL https://git.io/goreleaser --snapshot | bash'
                        sh 'curl -sL https://git.io/goreleaser | bash --snapshot'
                    }


                }

                /*
                withCredentials([usernamePassword(credentialsId: 'github_token', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
                    git 'https://github.com/ssmathistad/fzf.git'

                    sh("git tag -a $params.VERSION -m '$params.VERSIONMESSAGE'")
                    // no sh('git push https://${GIT_USERNAME}:${GIT_PASSWORD}@ssmathistad/fzf.git --tags'), cannot resolve url
                    
                    //sh('git push https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/ssmathistad/fzf.git --tags')
                    sh("git push https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/ssmathistad/fzf.git ${params.VERSION}")
                    //sh("export PATH=$PATH:/working_dir/go/bin")
                    //sh "/working_dir/bin/goreleaser --snapshot"
                    sh("/working_dir/bin/goreleaser release")
                }
                */

                //////sh "git tag -a $params.VERSION -m \"$params.VERSIONMESSAGE\""
                //git credentialsId: 'github_token', url: 'https://github.com/ssmathistad/fzf.git'
                //// no git push credentialsId: 'github_token', url: 'git@github.com:ssmathistad/fzf.git'
                
                // git@github.com:ssmathistad/fzf.git
                //git push
                /////////sh "git push"

                //withCredentials([usernamePassword(credentialsId: 'github_token', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
                ////withCredentials([usernamePassword(git credentialsId: 'github_token', url: 'https://github.com/ssmathistad/fzf.git')]) {
                    ////sh "git tag -a $params.VERSION -m \"$params.VERSIONMESSAGE\""
                    //sh "git push https://${GIT_USERNAME}:${GIT_PASSWORD}@https://github.com/ssmathistad/fzf.git $params.VERSION"
                    ////sh "git push"
                ////}
            //}
        }
        
        //stage('Deploy Go Releaser binaries') {
        //    steps {
        //        sh "/working_dir/bin/goreleaser release"
        //    }
        //}
    }
}