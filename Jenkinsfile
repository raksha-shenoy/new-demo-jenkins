pipeline {
    agent any

    environment {
        SCANNER_HOME = tool 'sonar'
        SONARQUBE_SERVER = credentials('SONAR_AUTH_TOKEN')
    //     // Define environment variables if needed
        DOCKERFILE_PATH = 'C:\\Users\\RakshaShenoy\\new-demo-jenkins\\Dockerfile' // Update this with your Dockerfile path
        DOCKER_IMAGE_TAG = 'keer:latest' // Update with your desired image name and tag
    //     SONAR_PROJECT_KEY = 'new-demo-jenkins'
    //     SONAR_AUTH_TOKEN = 'squ_1b73eb70b78e5c0bc381db6b3d9e46852b6ae5db'
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
        stage('SonarQube Scan') {
            steps {
                script{
                    withSonarQubeEnv('sonar') {
                          bat "${SCANNER_HOME}/bin/sonar-scanner"

                    }
                }
            }
        }
    }
}
    
// }
//                     bat ''' $SCANNER_HOME/C:\\Users\\RakshaShenoy\\sonarqube-10.2.1.78527\\sonarqube-10.2.1.78527\\bin\\windows-x86-64\\sonar \
                            // -Dsonar.projectKey=new-demo-jenkins \
//                             -Dsonar.projectName=new-demo-jenkins \
// //                     '''

                  
//                 }
//             }
    //     }
    // }

           
       

       