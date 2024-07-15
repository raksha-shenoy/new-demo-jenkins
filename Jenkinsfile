pipeline {
    agent any

    environment {

        SCANNER_HOME = tool 'sonar'
        
        DOCKERFILE_PATH = 'C:\\Users\\RakshaShenoy\\new-demo-jenkins\\Dockerfile' // Update this with your Dockerfile path
        DOCKER_IMAGE_TAG = 'keer:latest' // Update with your desired image name and tag
        SONAR_PROJECT_KEY = 'new-demo-jenkins'
        registry = 'rakshashenoy/samplerepo'
        registryCredential = 'DOCKER_CREDENTIAL'
      
    }

    stages {
        stage('SonarQube Scan') {
            steps {
                script{
                    // def props = readProperties file: 'sonar-project.properties'
                    withSonarQubeEnv('sonar') {
                        bat "${SCANNER_HOME}/bin/sonar-scanner -Dsonar.projectKey=${SONAR_PROJECT_KEY}" 

                    }
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image using Docker Pipeline plugin
                    dockerImage = docker.build("${DOCKER_IMAGE_TAG}", "-f ${DOCKERFILE_PATH} .") 
                    docker tag dockerImage:latest docker.io/rakshashenoy/keer:latest
                    

                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                script {
                    // Build Docker image using Docker Pipeline plugin
                    docker.withRegistry( '', registryCredential) { 
                    dockerImage.push()
                }
            }
        }
    }  
        
    }
}
    

           
       

       