pipeline {
	
	agent {
		label 'win'
	}
	stages{
		stage('Build') {
			steps {
				bat "D:\\devSoft\\apache-maven-3.5.3\\bin mvn -B -DskipTests clean package"
			}
		}
	}
}
