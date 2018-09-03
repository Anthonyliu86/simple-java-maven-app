pipeline {
	
	agent any
	
	stages{
		stage('Build') {
			steps {
				sh "cd /tmp/apache-maven-3.5.4/bin "
				sh 'mvn -v'
				sh 'mvn -B -DskipTests clean package'
			}
		}
		stage('Test') {
			steps {
                		sh 'mvn test'
            }
            		post {
                		always {
                    			junit 'target/surefire-reports/*.xml'
                		}
            		}
		}
		stage('Depoly') { 
            		steps {
                		sh './jenkins/scripts/Depoly.bat' 
            		}
        	}
		
	}
	
	
}
