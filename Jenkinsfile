node {
	try {
        stage('Checkout') {
			checkout scm
        }
		stage('Environment') {
      		sh 'git --version'
      		echo "Branch: ${env.BRANCH_NAME}"
      		sh 'docker -v'
      		sh 'printenv'
    	}
        stage('Build') {
			if(env.BRANCH_NAME == 'master'){
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
