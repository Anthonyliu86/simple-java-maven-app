pipeline {
	
	agent {
		label 'win'
	}
	parameters {
        	text(name: 'EMail', defaultValue: 'yuangen.liu@oracle.com', description: 'Enter the user email address.')
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
		stage('Depoly') { 
            		steps {
                		bat './jenkins/scripts/Depoly.bat' 
            		}
        	}
		
	}
	post{ 
        	always { 
            		emailext body: '''Welcome to Jenkins email alert.
			Thanks,
			Anthony''', subject: 'Jenkins Job : ${env.JOB_ID} had run with ${currentBuild.result} status.', to: 'yuangen.liu@oracle.com'
        	}
    	}
	
}
