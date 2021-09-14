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

### Build
A build is the result of a single execution of a project.

### Build step
A single task with a project

### Build Trigger
A criteria for starting a new pipeline to run

### Artifacts
Immutable files that are generated during a build or a pipeline run. Archived on the Jenkins master for later retrieval. Maintained in a repository.

### Repositories
Hold items that need to be retrieved.

### Build Tools
The software that actually performs the build portion of the pipeline

### Build Configuration steps
Configuration depends on the tool, but general steps are:
1. Start Jenkins and install required plugins
2. Perform Global Configuration steps - Telling Jenkins what the build tool is and how you interact with it
3. Create a Job/project that uses the tool
4. Update tools configuration file

### Clean Checkout
Clean checkout is when you delete the local repository and checkout a new copy of the repo.

### Test types
- Unit Test: Test of individual components (classes, methods, modules) to ensure outputs are as expected
- Smoke Test: General test of the software to check functionality. To see if it is stable enough for further testing.
- Verification Test: "Did we satisfy the build requirements?"
- Functional Test: "Does this feature work?" or "Can a user do this?"
- Acceptance Test: Handoff test woth the client to verify that it does what they expect it to do

### Notifications
Notifications give active feedback to the status of processes within the project.

### Types of notifications
- Email
- SMS
- Instant Messaging configured by plugins

### Distribuited Builds
Build jobs in which the executor of the build is located on a node separate from the master. Done for parallelism: Running multiple things at once. Master node acts as a controller for the build, running specific builds on specific agents. 

### Tags
Agents are tagged to determine what type should be run on what agent. This is so that a node with a specific configuration can run pipeline steps that match it.

### Fugible
Agents should be fungible (AKA replaceable). This means that local configuration on the agent should be kept to a minimum and global configuration on the master should be preferred.

### Plugins
Extensions to Jenkins that extends it's functionality.

### Plugin Manager
Allows you to add, remove, disable, or enable plugins. Also provides information about a plugin such as version conflicts and isses that may arise from an update or installation.

### Jenkins API
A REST API for programmatically interacting with the Jenkins Server.

### Matrix Security
Provides ability to configure security based on different sections or contexts. Can be Global based or project based.

### Security Inheritance Options
- Inherit from Parent: for projects that are in a folder or the child of another object. Inherits the security of the parent object.
- Inherit Globally-defined Permissions: For projects that are in a folder or are the child of another object, but only want global permissions, **not** parent permissions
- Do Not inherit permission grants from other ACLs: Prevents job from inheriting any permissions from blobal or parent items. Only exmplicitly defined permissions are allowed.

### Auditing
The process of verifying that the access permissions are working as intended.

### Explicit allow
Jenkins is inherently explicit allow model. This means that anything that is not explicitly allowed, is denied.

### Additive
Jenkins Permissions are additive. Global -> parent -> job is how allows are stacked. If something is allowed at a level above and inheritance is allowed, then it is allowed in all the levels above.

### Credentials
Any value that provides access to a restricted resource, AKA a secret.

### Credential Provider
A location that has been configured for Jenkins to retrieve credentials