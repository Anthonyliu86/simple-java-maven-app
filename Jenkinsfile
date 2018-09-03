pipeline {
	
	agent any
	
	stages{
		stage('Build') {
			steps {
				sh "cd /tmp/apache-maven-3.5.4/bin "
				sh "export M2_HOME=/opt/apache-maven-3.3.9 # your Mavan home path"
				sh "export PATH=$PATH:$M2_HOME/bin"
				sh 'mvn --version'
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
