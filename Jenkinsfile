pipeline {
    agent {
        label "docker"
    }
    
    environment{
        def DOCKER_IMAGE = "jenkins-oft-arch-builder"
        def DOCKER_REGISTRY = ""
    }
    
    stages{
        stage("checkout") {
            steps{
                checkout scm
            }
        }
        
        stage("build docker") {
            steps{
                sh "docker build -t ${DOCKER_IMAGE} -f docker/Dockerfile ."
            }
        }
        
        stage("render html") {
            steps {
                sh "docker run --rm -v $WORKSPACE:/home/jenkins -v $WORKSPACE/.m2/:/root/.m2/repository ${DOCKER_IMAGE} mvn -B -U clean compile"
                archiveArtifacts artifacts: '**/target/*.html,**/target/**/*', fingerprint: true
            }
        }
        
        stage("render pdf") {
            steps { 
                sh "docker run --rm -v $WORKSPACE:/home/jenkins -v $WORKSPACE/.m2/:/root/.m2/repository ${DOCKER_IMAGE} mvn -B -U compile -P render-pdf"
                archiveArtifacts artifacts: '**/target/*.pdf', fingerprint: true
            }
        }
    }
    
    options {
        buildDiscarder(logRotator(numToKeepStr:'10'))
        timeout(time: 60, unit: 'MINUTES')
        disableConcurrentBuilds()
    }
}
