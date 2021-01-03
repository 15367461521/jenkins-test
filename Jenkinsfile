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
                      mvn clean package -DskipTests dockerfile:build'''
                sh 'docker tag jenkinstest registry.cn-hangzhou.aliyuncs.com/zhongjun/spring-boot-jenkins-test:latest'
                withCredentials([usernamePassword(credentialsId: '1dfc6b7d-f6d7-48dd-9c5d-96aabbd0d6d9', passwordVariable: 'password', usernameVariable: 'username')]) {
                    sh 'docker login --username=${username} --password=${password} registry.cn-hangzhou.aliyuncs.com'
                    sh 'docker push registry.cn-hangzhou.aliyuncs.com/zhongjun/spring-boot-jenkins-test:latest'
                }
            }
        }
    }
}
