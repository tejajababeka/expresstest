node {
	try {
        stage('Checkout') {
		checkout scm
        }
        stage('Build') {
  		steps {
    			script {
        			def now = new Date()
        			println now.format("yyMMdd.HHmm", TimeZone.getTimeZone('UTC'))
    			}
  		} 
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
