pipeline {
    agent any
    
    //parameters {
    //    string(name: 'VERSION', defaultValue: 'v0.26')
    //    string(name: 'VERSIONMESSAGE', defaultValue: 'Bumping version')
    //}

    environment {
        GITHUB_TOKEN = credentials('repo_use_token')
        PATH = "/working_dir/go/bin:/working_dir/bin/goreleaser:working_dir/bin:$PATH"
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
                //sh("git clone 'https://github.com/ssmathistad/fzf.git'")
                sh("pwd")
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
                    PATH = "/working_dir/go/bin:/working_dir/bin/goreleaser:working_dir/bin:/bin/goreleaser:$PATH"
                }
                steps {

                    withCredentials([usernamePassword(credentialsId: 'github_token', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
                        sh "git config --global user.name ssmathistad"
                        sh "git config --global user.email ssmathistad@mail.csuchico.edu"
                        //sh "git tag -d $(git tag -l)"
                        //sh "git config --list --show-origin"
                        //sh("git tag -d v0.26.1")
                        //sh("git tag -d v0.26.2")
                        sh("git tag -a v0.27.${BUILD_NUMBER} -m \"Version Bumped\"")
                        //sh("git show")
                        //sh("git log --oneline --decorate=short")
                        //sh("pwd")
                        sh("echo ${WORKSPACE}")
                        //sh("pwd")
                        //sh("ls")
                        //sh("cd ${WORKSPACE}/fzf")
                        //sh("pwd")
                        //sh("ls")

                        //sh("git remote add origin https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/${GIT_USERNAME}/fzf.git")

                        sh("git push https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/${GIT_USERNAME}/fzf.git --tags");

                        //checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [[$class: 'PerBuildTag']], userRemoteConfigs: [[credentialsId: 'github_token', url: 'https://github.com/ssmathistad/fzf.git']]])

                        //sh("git remote add origin git@github.com:github.com/ssmathistad/fzf.git")

                        //sh("git push https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/ssmathistad/fzf.git --tags")

                        sh("/working_dir/bin/goreleaser --snapshot --rm-dist")
                        //sh("/working_dir/bin/goreleaser v0.27.${BUILD_NUMBER}")//--snapshot --rm-dist")
                        ////sh("./goreleaser.sh latest") //v0.27.${BUILD_NUMBER}")

                        //sh 'curl -sL https://git.io/goreleaser | bash --snapshot'
                        ////sh("./bin/goreleaser --snapshot --rm-dist")
                        ////////sh 'source curl -sL https://git.io/goreleaser | bash'
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