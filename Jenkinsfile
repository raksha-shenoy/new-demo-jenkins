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
        stage('Run Trivy Scan') {
            steps {
                script {
                    def trivyReport = docker.image("${DOCKER_IMAGE_TAG}").inside("--entrypoint='' --no-progress --format json") { c ->
                        def output = c.sh(script: 'trivy <your_image_name_or_id>', returnStdout: true).trim()
                        writeFile file: 'trivy_report.json', text: output
                        return output
                    }

                    // Archive Trivy scan report as artifact
                    archiveArtifacts artifacts: 'trivy_report.json', allowEmptyArchive: true

                    // Optionally, you can print the Trivy scan report
                    echo "Trivy Scan Report:"
                    echo trivyReport
                }
            }
        }
    }
}
           
       

       