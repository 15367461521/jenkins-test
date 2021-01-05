pipeline {
    agent any

    stages {
        stage('build project') {
            steps {
                // 进行远程项目部署
                sh '''#!/bin/sh -l
                    ssh root@172.17.0.3
                    sh /opt/jenkins_shell/deploy.sh'''
            }
        }
    }
}
