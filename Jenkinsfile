pipeline {
    agent any

    environment {
        // Define environment variables if needed
        DOCKERFILE_PATH = 'C:\\Users\\RakshaShenoy\\new-demo-jenkins\\Dockerfile' // Update this with your Dockerfile path
        DOCKER_IMAGE_TAG = 'keer:latest' // Update with your desired image name and tag
    }

    stages {
        // stage('Checkout') {
        //     steps {
        //         // Checkout the code from Git
        //         git 'https://github.com/raksha-shenoy/new-demo-jenkins.git'
        //     }
        // }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image using Docker Pipeline plugin
                    docker.build("${DOCKER_IMAGE_TAG}", "-f ${DOCKERFILE_PATH} .")
                }
            }
        }
           
       

        // Add more stages for testing, deployment, etc.
        // Example:
        // stage('Test') {
        //     steps {
        //         sh 'echo "Run tests"'
        //     }
        // }

        // stage('Deploy') {
        //     steps {
        //         sh 'echo "Deploy your application"'
        //     }
        // }
    }

    // post {
    //     success {
    //         echo 'Docker image build and pipeline succeeded!'
    //     }
    //     failure {
    //         echo 'Pipeline failed!'
    //     }
    // }
}
