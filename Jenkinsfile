pipeline {
	
	agent {
		label 'win'
	}
	parameters {
        	string(name: 'email', defaultValue: 'xxxx@ccc.com', description: 'Enter the user email address.')
	}
	stages{
		stage('Build') {
			options {
                		timeout(time: 15, unit: 'SECONDS') 
            	}
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
		Anthony''', subject: "Jenkins Job : ${env.JOB_ID} had run with ${currentBuild.result} status.", to: "${params.email}"
        	}
    	}
	
}
