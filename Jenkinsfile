node {
	try {
        stage('Checkout') {
			checkout scm
        }
		stage('Environment') {
      		sh 'git --version'
      		sh 'docker -v'
      		sh 'printenv'
			sh 'git branch'
    	}
        stage('Build') {
			if(env.BRANCH_NAME == 'master'){
				def now = new Date()
				println now
				sh 'docker -v'
				sh 'docker stop test || true && docker rm test || true'
            	sh 'docker build -t test/node-web-app .'
				sh 'docker run -p 3005:3000 --name test -d test/node-web-app'
			}
        }
	}
	catch (err) {
		throw err
	}
}
