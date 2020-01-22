node {
	try {
        stage('Checkout') {
		checkout scm
        }
        stage('Build') {
			sh 'docker -v'
			sh 'docker stop test/node-web-app || true && docker rm test/node-web-app || true'
            sh 'docker build -t test/node-web-app .'
			sh 'docker run -p 3005:3000 --name test -d test/node-web-app'
        }
	}
	catch (err) {
		throw err
	}
}
