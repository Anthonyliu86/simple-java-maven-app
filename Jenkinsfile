pipeline {
	
	agent {
		label 'win'
	}
	stages{
		stage('Build') {
			steps {
				bat "cd D:\\devSoft\\apache-maven-3.5.3\\bin"
				bat 'mvn -B -DskipTests clean package'
			}
		}
		stage('Test') {
			steps {
                		bat 'mvn test'
            }
            		post {
                		always {
                    			junit 'target/surefire-reports/*.xml'
                		}
            		}
		}
		stage('Deliver') { 
            		steps {
                		bat './jenkins/scripts/Depoly.bat' 
            		}
        	}
		
	}
	
}
