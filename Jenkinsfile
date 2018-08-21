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
	}
}
