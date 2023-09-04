pipeline {
  agent none
  stages {
    stage('build') {
      agent {
        docker {
          image 'schoolofdevops/carts-maven'
        }

      }
      steps {
        sh 'mvn clean compile'
      }
    }

    stage('test') {
      agent {
        docker {
          image 'schoolofdevops/carts-maven'
        }

      }
      steps {
        sh 'mvn test'
      }
    }

    stage('package') {
      agent {
        docker {
          image 'schoolofdevops/carts-maven'
        }

      }
      steps {
        sh 'mvn package -DskipTests'
        archiveArtifacts(artifacts: '**/target/*.jar', fingerprint: true)
      }
    }

    stage('docker build and publish') {
      agent any
      steps {
        script {
          docker.withRegistry('https://index.docker.io/v1/', 'dockerlogin') {
            def dockerImage = docker.build("gowthams96/carts:v${env.BUILD_ID}", "./")
            dockerImage.push()
            dockerImage.push("latest")
          }
        }

      }
    }

  }
  tools {
    maven 'Maven 3.9.4'
  }
}