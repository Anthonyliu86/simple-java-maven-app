pipeline {
	
	agent any
	parameters {
        	string(name: 'email', defaultValue: 'xxxx@ccc.com', description: 'Enter the user email address.')
	}
	stages{
		stage('Build') {
			options {
                		timeout(time: 15, unit: 'SECONDS') 
            	}
			steps {
				sh "cd /tmp/apache-maven-3.5.4 "
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
	post{ 
        	always { 
            		emailext body: '''Welcome to Jenkins email alert.
		Thanks,
		Anthony''', subject: "Jenkins Job : ${env.JOB_ID} had run with ${currentBuild.result} status.", to: "${params.email}"
        	}
    	}
	
}
