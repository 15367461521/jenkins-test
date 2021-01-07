pipeline {
    agent any

    stages {
        stage('pull project') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'e7c0de3a-2c76-44a4-95af-364a360e4eef', url: 'git@github.com:15367461521/jenkins-test.git']]])
            }
        }

        steps {
            //maven 打包，docker build
            sh '''#!/bin/sh -l
                  mvn clean package -DskipTests dockerfile:build'''
            //docker 打标签
            sh 'docker tag jenkinstest registry.cn-hangzhou.aliyuncs.com/zhongjun/spring-boot-jenkins-test:latest'
            //登录阿里docker镜像仓库，上传镜像
            withCredentials([usernamePassword(credentialsId: '1dfc6b7d-f6d7-48dd-9c5d-96aabbd0d6d9', passwordVariable: 'password', usernameVariable: 'username')]) {
                sh 'docker login --username=${username} --password=${password} registry.cn-hangzhou.aliyuncs.com'
                sh 'docker push registry.cn-hangzhou.aliyuncs.com/zhongjun/spring-boot-jenkins-test:latest'
            }
            // 删除镜像
            sh 'docker rmi -f jenkinstest'
            sh 'docker rmi -f registry.cn-hangzhou.aliyuncs.com/zhongjun/spring-boot-jenkins-test'

            // 进行远程项目部署
            sshPublisher(publishers: [sshPublisherDesc(configName: 'java1', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '/opt/jenkins_shell/deploy.sh', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
        }
    }
}
