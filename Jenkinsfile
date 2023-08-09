pipeline {
    agent any 
    
    stages{
        stage("Clone Code"){
            steps {
                echo "Cloning the code"
                git url:"https://github.com/sumitbro/vue-app-latest.git", branch: "master"
            }
        }
        stage('Build and Run Docker Containers') {
            steps {
                echo "Building the image"
                script {
                    def dockerComposeFile = 'docker-compose.yml'

                    // Build Docker containers using docker-compose
                    sh "docker-compose -f ${dockerComposeFile} build"

                    // Run Docker containers using docker-compose
                    sh "docker-compose -f ${dockerComposeFile} up -d"
                }
            }
        }
    }

    post {
        always {
            // Clean up Docker containers and volumes when the pipeline finishes
            script {
                def dockerComposeFile = 'docker-compose.yml'
                
                // Stop and remove Docker containers created by docker-compose
                sh "docker-compose -f ${dockerComposeFile} down"
                
                // Optionally, remove unused Docker volumes
                sh "docker volume prune -f"
            }
        }
    }

        
       
}



// pipeline {
//     agent any

//     stages {
//         stage('Checkout') {
//             steps {
//                 // Checkout your source code from version control (e.g., Git)
//                 // Use appropriate SCM checkout step
//             }
//         }

//         stage('Build and Run Docker Containers') {
//             steps {
//                 script {
//                     def dockerComposeFile = 'docker-compose.yml'

//                     // Build Docker containers using docker-compose
//                     sh "docker-compose -f ${dockerComposeFile} build"

//                     // Run Docker containers using docker-compose
//                     sh "docker-compose -f ${dockerComposeFile} up -d"
//                 }
//             }
//         }
//     }

//     post {
//         always {
//             // Clean up Docker containers and volumes when the pipeline finishes
//             script {
//                 def dockerComposeFile = 'docker-compose.yml'
                
//                 // Stop and remove Docker containers created by docker-compose
//                 sh "docker-compose -f ${dockerComposeFile} down"
                
//                 // Optionally, remove unused Docker volumes
//                 sh "docker volume prune -f"
//             }
//         }
//     }
// }
