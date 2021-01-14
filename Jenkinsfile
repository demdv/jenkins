pipeline {
    agent any
    stage('scm') {
        checkout([$class: 'GitSCM',
          branches:[[name: '** /main']],
          doGenerateSubmoduleConfigurations: false,
          extensions:[],
          submoduleCfg:[],
          url: 'https://github.com/demdv/jenkins.git']]])
    }

    stages {
        stage('Build') {
            steps {
               

               sh '''              
               docker build -t nginxtest -f Dockerfile .
               $(aws ecr get-login --region us-west-2 --registry-ids 131460758684 --no-include-email )
               docker tag nginxtest 131460758684.dkr.ecr.us-west-2.amazonaws.com/nginxtest:latest
               docker push 131460758684.dkr.ecr.us-west-2.amazonaws.com/nginxtest:latest
               docker rmi -f $(docker images -q)
               '''
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}



 
