node {
	try {
        stage('Checkout') {
			checkout scm
        }
		stage('Environment') {
      		sh 'git --version'
      		sh 'docker -v'
      		sh 'printenv'
    	}
		stage('Build Docker test'){
     		sh 'docker build -t express-test -f Dockerfile.test --no-cache .'
    	}
    	stage('Docker test'){
      		sh 'docker run --rm express-test'
    	}
    	stage('Clean Docker test'){
      		sh 'docker rmi express-test'
    	}
        stage('Build') {
			def now = new Date()
			println now
			sh 'docker -v'
			sh 'docker stop test || true && docker rm test || true'
            sh 'docker build -t test/node-web-app .'
			sh 'docker run -p 3005:3000 --name test -d test/node-web-app'
        }
	}
	catch (err) {
		throw err
	}
}
