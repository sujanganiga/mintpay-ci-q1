pipeline {
  agent any
  options { ansiColor('xterm') }
  stages {
    stage("Checkout") {
      steps {
        checkout scm
        sh 'ls -la'
      }
    }
    stage("Build Docker image") {
      steps {
        echo "Building Docker image: mintpay:${BUILD_NUMBER}"
        sh "docker build -t mintpay:ci-${BUILD_NUMBER} ."
      }
    }
    stage("Run container (execute script)") {
      steps {
        echo "Running container to execute print_mintpay.sh"
        // run and show output, remove when finished
        sh "docker run --rm mintpay:ci-${BUILD_NUMBER}"
      }
    }
    stage("Cleanup") {
      steps {
        echo "Removing image"
        sh "docker rmi mintpay:ci-${BUILD_NUMBER} || true"
      }
    }
  }
  post {
    always {
      archiveArtifacts artifacts: 'print_mintpay.sh', allowEmptyArchive: true
      echo "Pipeline finished (status: ${currentBuild.currentResult})"
    }
  }
}
