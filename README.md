# Final-Jenkins-Sonarqube-Postgress-Nexus-Wildfly-Apache-Maven
Module exit task
1.	Install Jenkins server on virtual machine A (VM-A). All installation files should be located in one folder. Create symbolic links from installation folder into filesystem.
2.	Install Apache server on VM-A. Configure access to Jenkins through ‘/ enkins’ URL suffix.
3.	Install MySQL (or Oracle) database on virtual machine B (VM-B). Note: it is possible to install this and subsequent software on the same machine VM-A.
4.	Install Sonar server on VM-B. Configure Sonar with previously installed database. Configure Apache so that Sonar is accessible through ‘/sonar’ URL suffix. Add your custom Quality Profile, configure several Alerts. Tweak alert values so that your project has red alerts on the project analysis dashboard.
5.	Install Nexus server on VM-B. Configure Jenkins settings.xml so that only this Nexus server is used by Maven build.
6.	Install Jboss application server on VM-B.
7.	Configure Jenkins – install Build Pipeline Plugin, Jenkins Clone Workspace SCM Plugin, Locks and Latches plugin, Radiator View Plugin, Sonar plugin, Email-ext plugin, Git plugin.
8.	Configure Jenkins Security – disable default unauthorized access to instance. There should be 3 users in the system: admin – full access, developer – full access to job functions, viewer – read-only access to job status. These users should be created in addition to authentication configuration.
9.	Configure Jenkins Tools locations – add Maven, Java, Ant locations in the system (don’t use install automatically functionality)
10.	Add key-based authentication between machines VM-A and VM-B for  enkins user (bidirectional if both VM’s should connect to each other).
11.	Configure Jenkins clustering – add single node residing on VM-B
12.	Select open-source project which will be used for implementation of deployment pipeline. Prerequisites for the project – Java based, Maven-based build, sources in src/main/java folder, unit tests in src/test/java folder, .war as build artifact to be deployed onto Jboss server. This project should be located in GitHub (github.com). Fork this project into local account (so that you will be able to push some changes yourself).
13.	Build pipeline – create Job-1 which will pull project from remote Git repository and perform its build and tests. Schedule should be set to every 5 min to perform SCM poll. Push project artifact (.jar or .war files) into Nexus automatically as the Post-Build action of the job. Perform archivation of the same artifact so that it is available for downstream project.
14.	Build pipeline – add downstream Job-2 which will automatically deploy (.war). This artifact should be taken from previous Job-1 artifact to Jboss application server. Note that artifact should be not built from scratch but rather propagated from Job-1 and Job-2. This job should be tightened to VM-B slave node. 
15.	Create deployment script and deployment folder structure on VM-A. Deployment script should take archive file with .war inside as input, unpack it, perform current installation backup and do deployment.
16.	In the Build Actions section of Job-2 – add shell execution that will pack .war file, SCP it to VM-A and execute deployment script. Make sure that there is no absolute path to Jenkins workspace files.
17.	Build pipeline – add downstream Job-3 which will verify that your deployment occurred without problems – either verify HTTP status of application (status is 200) or presence of files on the remote server.
18.	Add Email notification to every Job in the pipeline. Emails should be triggered only on build unstable and failure statuses. Job-3 should send email also on success status. Subject should contain Job type name and build result.
19.	Execute pipeline several times (have at least 3 executions done via automatic trigger using Poll SCM functionality). Configure build pipeline view. Ensure pipeline view is displaying all 3 jobs and has several executions (3-5).

Task results:
1.	Apache HTTP server, Jenkins, Sonar, Nexus are installed and running. In the URL there is no port number.
2.	Sonar has custom Quality Profile with a couple of user-defined alerts.
3.	Nexus is used for all Maven build artifact resolution and download.
4.	Jenkins has clustered configuration (1 master and 1 slave). Slave has unique label. 
5.	Test and automatic deploy jobs are running on VM-B (show this on node configuration screen)
6.	Compile and verification jobs are running on VM-A (show this on node configuration screen)
7.	Build pipeline is configured and consists of 3 separate Jobs.
8.	Job-1 is doing pull from remote Git repository on an event of new changes in that repository.
9.	Job-2 is calling deployment script providing archive with .war.
10.	Job-3 is testing deployment status
11.	GitHub account is used for source retrieval. There are commits in remote GitHub which trigger local build pipeline.
12.	Deploy script is created and use input archive (.zip or .gz), unpack it, perform backup and .war deployment with server restart.
13.	Build pipeline is visualized with pipeline plugin (separate view is available).
14.	Email is sent on build failure or unstable status of Job-1, Job-2 and Job-3
15.	Sonar report is available for browse (analysis of project has been performed).
16.	Unit test results are available both in Sonar and Jenkins build pages. 
