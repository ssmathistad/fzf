pipeline {
    agent any
    
    parameters {
        string(name: 'VERSION', defaultValue: 'v0.26')
        string(name: 'VERSIONMESSAGE', defaultValue: 'Bumping version')
    }

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
        
        stage('Go Releaser tag creation') {
            steps {


                withCredentials([usernamePassword(credentialsId: 'github_token', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
                    git 'https://github.com/ssmathistad/fzf.git'

                    sh("git tag -a $params.VERSION -m '$params.VERSIONMESSAGE'")
                    // no sh('git push https://${GIT_USERNAME}:${GIT_PASSWORD}@ssmathistad/fzf.git --tags'), cannot resolve url
                    
                    //sh('git push https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/ssmathistad/fzf.git --tags')
                    sh("git push origin https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/ssmathistad/fzf.git ${params.VERSION}")
                    //sh("export PATH=$PATH:/working_dir/go/bin")
                    //sh "/working_dir/bin/goreleaser --snapshot"
                    sh "/working_dir/bin/goreleaser release"
                }

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
            }
        }
        
        //stage('Deploy Go Releaser binaries') {
        //    steps {
        //        sh "/working_dir/bin/goreleaser release"
        //    }
        //}
    }
}