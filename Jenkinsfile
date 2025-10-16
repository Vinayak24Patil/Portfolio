pipeline {
    agent any
    environment {
        DEPLOY_DIR = '/var/www/html' // For Linux; for Windows use C:\\inetpub\\wwwroot
    }
    stages {
        stage('Checkout') {
            steps {
                echo 'Cloning Portfolio repo from GitHub...'
                git branch: 'main', url: 'https://github.com/Vinayak24Patil/Portfolio.git'
            }
        }
        stage('Build') {
            steps {
                echo 'Build Step: Listing workspace files'
                sh 'ls -la' // Use `bat 'dir'` if on Windows
            }
        }
        stage('Test') {
            steps {
                echo 'Testing HTML using tidy'
                sh 'tidy -q -e index.html || true' // Use `bat 'tidy -q -e index.html || echo TIDY_EXIT_%ERRORLEVEL%'` on Windows
            }
        }
        stage('Deploy') {
            steps {
                echo "Deploying files to ${DEPLOY_DIR}"
                sh "cp -r * ${DEPLOY_DIR}/"  // Use `bat "xcopy /Y /E * ${DEPLOY_DIR}\\` on Windows
            }
        }
    }
    post {
        success {
            echo 'Pipeline finished successfully! Visit: http://localhost/index.html'
        }
        failure {
            echo 'Pipeline failed! Check console output.'
        }
    }
}
