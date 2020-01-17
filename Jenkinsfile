pipeline {
    agent {
        dockerfile true
    }
    stages {
        stage('Build') {
            steps {
		sh 'docker -v'
                sh 'docker build -t test/node-web-app .'
		sh 'docker run -p 3000:3001 -d test/node-web-app'
            }
        }
    }
}
