pipeline {
    agent any

    environment {

        SCANNER_HOME = tool 'sonar'
        
        DOCKERFILE_PATH = 'C:\\Users\\RakshaShenoy\\new-demo-jenkins\\Dockerfile' // Update this with your Dockerfile path
        // DOCKER_IMAGE_TAG = 'keer:latest' // Update with your desired image name and tag
        DOCKER_IMAGE_NAME = 'keer:v1'
        // DOCKER_IMAGE_TAG = 'latest'
        REGISTRY_IMAGE = 'docker.io/rakshashenoy/keer:v1'
        SONAR_PROJECT_KEY = 'new-demo-jenkins'
        DOCKER_REGISTRY = 'https://hub.docker.com/r/rakshashenoy/keer'
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
                    // dockerImage = docker.build("${DOCKER_IMAGE_TAG}", "-f ${DOCKERFILE_PATH} .")
                    bat "docker build -t ${DOCKER_IMAGE_NAME} ."
                    bat "docker images"
                    //docker.tag dockerImage:latest docker.io/rakshashenoy/keer:latest
                    // docker.tag(dockerImage, 'rakshashenoy/samplerepo/keer:latest')

                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Build Docker image using Docker Pipeline plugin
                    docker.withRegistry( 'https://docker.io', registryCredential) { 
                     // Tag the Docker image
                    bat "docker tag ${DOCKER_IMAGE_NAME} ${REGISTRY_IMAGE}"
                    // dockerImage.push()
                    // bat "docker push rakshashenoy/keer:tagname"
                    // bat "docker push ${dockerImage}"
                    bat "docker push ${REGISTRY_IMAGE}"
                    }
                }
            }
        }
        // stage('Push Docker Image') {
        //     steps {
        //         script {
        //             // Push Docker image to registry
        //                    docker.withRegistry("${DOCKER_REGISTRY}", REGISTRY_CREDENTIAL) {
        //                       dockerImage.push("${DOCKER_IMAGE_TAG}")
        //                 }
        //             }
        
        
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
    

        
    

                