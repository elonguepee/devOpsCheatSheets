# Jenkins Cheatsheet
A cheat sheet for Jenkins commands and concepts

## Concepts
### Continuous Integration vs. Continuous Delivery vs. Continuous Deployment
- Continuous Integration: Small frequent steps
- Continuous Delivery: Continually creating code automatically that is a candidate for deployment. This means creating code that is ready to deploy, but not necessarily deploying it.
- Continous Deployment: Continually using automated processes to push code out.

### Jobs/ Project
A job in Jenkins is any runnable task in Jenkins. It is now called a project in Jenkins documentation.

### Job/Project Types
- Freestyle Project: Most common type of project. Normally executes a bash or powershell command
- Pipeline: Used to be called workflow. Written in DSL. For things that do not fit in a freestyle project because they are too complicated/span multiple nodes.
- Mutli-configuration Project: For projects that will be tested in multiple environments and require different configurations, depending on the environment.
- Github Organization: Can use the source control platform's organization and allows Jenkins to act on Jenkinsfiles within the orgs repositories
- Folder: A method to group projects together. The folder name becomes part of the path of the projects
- Multi-Branch Pipelines: Jenkins uses a Jenkinsfile to mark repositories. If a branch is created in that repository, Jenkins will create a project/job in Jenkins for that branch.

### Job/project scope
Includes all items that are part of the job/project. In some cases global libraries will be available to all jobs.