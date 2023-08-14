// pipeline {
//     agent any 
    
//     stages{
//         stage("Clone Code"){
//             steps {
//                 echo "Cloning the code"
//                 git url:"https://github.com/sumitbro/vue-app-latest.git", branch: "master"
//             }
//         }
//         stage('Build and Run Docker Containers') {
//             steps {
//                 echo "Building the image"
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


pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build and Deploy') {
            steps {
                script {
                    def remoteScript = '''
                        #!/bin/bash
                        cd /var/www/html/vue-app-latest
                        echo "hello" >text.txt 2>&1
                        
                    '''
                    sshPublisher(
                        continueOnError: true,
                        failOnError: true,
                        verbose: true,
                        publishers: [sshPublisherDesc(configName: 'demo-server', transfers: [sshTransfer(execCommand: remoteScript)])]
                    )
                }
            }
        }
    }
}

// pipeline {
//     agent any

//     stages {
//         stage('Checkout') {
//             steps {
//                 checkout scm
//             }
//         }

//         stage('Build and Deploy') {
//             steps {
//                 script {
//                     def remoteScript = '''
//                         #!/bin/bash
//                         cd /var/www/html/vue-app-latest
//                         echo "hello" > text.txt 2>&1
//                     '''

//                     def remoteHost = '20.198.98.206'
//                     def remoteUser = 'azureuser'
//                     def remotePort = '22'  // Default SSH port

//                     publishOverSSH(
//                         target: [
//                             allowAnyHosts: true,
//                             alwaysTransfer: true,
//                             host: remoteHost,
//                             port: remotePort,
//                             remoteDir: '/home/azureuser',
//                             user: remoteUser
//                         ],
//                         transfers: [
//                             sshTransfer(
//                                 execCommand: remoteScript,
//                                 printExecOutput: true
//                             )
//                         ]
//                     )
//                 }
//             }
//         }
//     }
// }