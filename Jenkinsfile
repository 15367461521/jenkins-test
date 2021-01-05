pipeline {
    agent any

    stages {
        stage('build project') {
            steps {
                // 进行远程项目部署
                sshPublisher(publishers: [sshPublisherDesc(configName: 'java1', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: 'echo hello', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
            }
        }
    }
}
