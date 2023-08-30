pipeline {
        agent {
                docker {
                        image 'gowthams96/carts-maven:latest'
                }
        }
        tools {
                maven 'Maven 3.9.4'
		jdk 'JDK 20.0.2'
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
