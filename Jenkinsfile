node('docker') {
        stage('Dump Vars') {
                sh('export')
        }

        stage('Checkout') {
                checkout scm
        }

        stage('Build') {
            try{
                def docker_repo = "jhulibraries"
                def image_name = "jenkins-ssh-agent-base"
                def tag = VersionNumber (versionNumberString: '${BUILD_DATE_FORMATTED, "yyyyMMdd"}_${BUILD_ID}')

                withDockerRegistry([ credentialsId: "dockerHubDerek", url: "" ]) {
                        def customImage = docker.build("${docker_repo}/${image_name}:${tag}")

                        customImage.push()
                        customImage.push("latest")

                }
            } catch(err) {
                // do nothing
            } finally {
                sh('docker system prune -a --force')
            }
        }
}