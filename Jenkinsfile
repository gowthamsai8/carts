pipeline {
        agent any
        tool {
                mvn 'Maven3.9.4'
        }
        stages {
                stage('build') {
                        steps {
                                sh 'mvn compile'
                        }
                }
                stage('test') {
                        steps {
                                sh 'mvn test'
                        }
                }
                stage('package') {
                        steps {
                                sh 'mvn package -DskipTests'
                                archiveArtifacts(artifacts: '**/target/*.war', firgerprint: true)
                        }
                }

        }
}
