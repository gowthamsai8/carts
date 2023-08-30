pipeline {
        agent {
                docker {
                        image 'maven:3-eclipse-temurin-11'
                }
        }
        tools {
                maven 'Maven 3.9.4'
        }
        stages {
                stage('build') {
                        steps {
                                sh 'mvn clean compile'
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
				archiveArtifacts artifacts: '**/target/*.jar', fingerprint: true
                        }
                }
        }
}
