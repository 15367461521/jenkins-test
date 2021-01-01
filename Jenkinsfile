pipeline {
    agent any

    stages {
        stage('pull project') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'b413c8af-a93d-4605-9d52-8b1a1f8b21c1', url: 'https://github.com/15367461521/jenkins-test.git']]])
            }
        }
        stage('builld project') {
            steps {
                sh '''#!/bin/sh -l
mvn clean package'''
            }
        }
    }
}
