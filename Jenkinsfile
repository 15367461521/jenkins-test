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
                // 进行远程项目部署
                sshPublisher(publishers: [sshPublisherDesc(configName: 'java2', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: 'sh /opt/jenkins_shh/deploy.sh', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
            }
        }
    }
}
