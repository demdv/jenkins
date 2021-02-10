pipeline {
    agent { label 'ec2-fleet' } 
    stages {
     stage('scm') {
         steps{
         git branch: 'main',
         url: 'https://github.com/demdv/jenkins.git'
         }
      }
        stage('Build') {
            steps {
               withAWS(credentials:'JenkinsEcr',region:'us-west-2') {
               sh '''
               whoami              
               docker build -t nginxtest -f Dockerfile .   
               $(aws ecr get-login --region us-west-2 --registry-ids 131460758684 --no-include-email)           
               docker tag nginxtest 131460758684.dkr.ecr.us-west-2.amazonaws.com/nginxtest:latest
               docker tag nginxtest 131460758684.dkr.ecr.us-west-2.amazonaws.com/nginxtest:BUILD_NUMBER
               docker push 131460758684.dkr.ecr.us-west-2.amazonaws.com/nginxtest:latest
               docker push 131460758684.dkr.ecr.us-west-2.amazonaws.com/nginxtest:BUILD_NUMBER
               docker rmi -f $(docker images -q)
               ''' 
               }
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