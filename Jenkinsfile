pipeline {
    agent any

    environment {

        SCANNER_HOME = tool 'sonar'
        
        DOCKERFILE_PATH = 'C:\\Users\\RakshaShenoy\\new-demo-jenkins\\Dockerfile' // Update this with your Dockerfile path
        DOCKER_IMAGE_TAG = 'keer:latest' // Update with your desired image name and tag
        SONAR_PROJECT_KEY = 'new-demo-jenkins'
        registry = 'https://hub.docker.com/u/rakshashenoy'
        registryCredential = 'DOCKER_CREDENTIAL'
      
    }

    stages {
        // stage('SonarQube Scan') {
        //     steps {
        //         script{
        //             // def props = readProperties file: 'sonar-project.properties'
        //             withSonarQubeEnv('sonar') {
        //                 bat "${SCANNER_HOME}/bin/sonar-scanner -Dsonar.projectKey=${SONAR_PROJECT_KEY}" 

        //             }
        //         }
        //     }
        // }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image using Docker Pipeline plugin
                    dockerImage = docker.build("${DOCKER_IMAGE_TAG}", "-f ${DOCKERFILE_PATH} .")
                    bat "docker images"
                    //docker.tag dockerImage:latest docker.io/rakshashenoy/keer:latest
                    // docker.tag(dockerImage, 'rakshashenoy/samplerepo/keer:latest')

                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Authenticate with Docker registry
                    // withCredentials([usernamePassword(credentialsId: DOCKER_CREDENTIALS, usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    //     docker.withRegistry("${DOCKER_REGISTRY}", 'docker') {
                    //         // Push Docker image
                    //         docker.image("${DOCKER_IMAGE_TAG}").push()
                            docker.withRegistry("${registry}", registryCredential) {
                            dockerImage.push("${DOCKER_IMAGE_TAG}")
                        }
                    }
        
        
        // stage('Push Docker Image') {
        //     steps {
        //         script {
        //             // Build Docker image using Docker Pipeline plugin
        //             // docker.withRegistry( '', registryCredential) { 
        //             // dockerImage.push()
                    
        //             // def imageName = "keer:latest"
        //             // def registryImage = "docker.io/rakshashenoy/keer:latest// Build the Docker image
        //             // bat "docker build -t ${imageName} Dockerfile"
 
        //             // Tag the Docker image
        //             bat "docker tag ${imageName} ${registryImage}"
 
        //             // Push the Docker image to the registry
        //             withDockerRegistry(credentialsId: 'a5606cb4-2093-43c5-9d06-c222d19bbfb6', toolName: 'docker') {
        //                 bat "docker push ${registryImage}"
        //         }
            
   
        
    }
        }
    }
}
        
    

                