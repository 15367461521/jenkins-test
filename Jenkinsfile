pipeline {
    agent any

    stages {
        stage('pull project') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'e7c0de3a-2c76-44a4-95af-364a360e4eef', url: 'git@github.com:15367461521/jenkins-test.git']]])
            }
        }
        stage('build project') {
            steps {
                sh '''#!/bin/sh -l
                      mvn clean package'''
            }
        }
    }
}
