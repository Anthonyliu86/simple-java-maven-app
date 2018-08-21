pipeline {
	
	agent {
		label ‘win’
	}
	stages{
		stage('Build') {
			steps {
				bat 'mvn -B -DskipTests clean package'
			}
		}
	}
}
