# Advanced DevOps Syllabus

---

## Table of Contents

1. [Linux & Shell Scripting](#module-1-linux--shell-scripting)
2. [AWS Core Services](#module-2-aws-core-services)
3. [Git & Version Control](#module-3-git--version-control)
4. [Jenkins](#module-4-jenkins)
5. [Docker](#module-5-docker)
6. [Kubernetes (CKA)](#module-6-kubernetes-cka-complete)
7. [Terraform Advanced](#module-7-terraform-advanced)
8. [Capstone Projects](#capstone-projects)

---

## Module 1: Linux & Shell Scripting

### 1.1 Linux Fundamentals

#### File System Hierarchy
The Linux file system follows a standard directory tree. Each directory has a specific purpose — `/etc` holds configuration files, `/var` holds variable data like logs, `/opt` is for optional third-party software, `/proc` exposes kernel and process information as virtual files, and `/sys` provides an interface to kernel subsystems and hardware.

#### File Permissions & Ownership
Every file in Linux has read, write, and execute permissions assigned to three entities: the owner, the group, and others. Permissions can be managed numerically or symbolically. Access Control Lists (ACLs) extend this model to allow granular permissions for specific users or groups beyond the basic three.

#### Process Management
A process is any running program on the system. Linux provides tools to view running processes, monitor CPU and memory consumption, send signals to processes, and manage background and foreground jobs. The `systemctl` command manages system services, while `journalctl` reads structured system logs.

#### User & Group Management
Linux is a multi-user operating system. Users are created and assigned to groups to control access to files and resources. Understanding how to create, modify, and delete users and groups, along with managing password policies and sudo privileges, is fundamental to system administration.

#### Package Management
Package managers handle the installation, update, and removal of software. RPM-based systems (RHEL, CentOS, Amazon Linux) use `yum` or `dnf`, while Debian-based systems (Ubuntu) use `apt`. Understanding repositories, package dependencies, and version locking is essential for consistent environments.

#### Networking Basics
Linux networking tools allow you to inspect open ports, active connections, routing tables, and DNS resolution. Understanding how to test connectivity, trace routes, and capture packets is critical for debugging application and infrastructure issues.

#### Disk Management
Disk management involves understanding how physical and virtual disks are partitioned, formatted, and mounted into the file system. Monitoring disk space usage and understanding inodes prevents storage-related outages in production environments.

#### Log Management
System and application logs are stored under `/var/log`. The `logrotate` utility automatically compresses and archives old logs to prevent disk exhaustion. Understanding how to read, filter, and forward logs using `rsyslog` or `syslog-ng` is important for observability.

#### Cron & Task Scheduling
Cron is the built-in Linux job scheduler. It allows commands or scripts to run automatically at defined intervals using a five-field time expression. Understanding crontab syntax, per-user crontabs, and system-wide cron directories enables automation of routine tasks.

---

### 1.2 Shell Scripting

#### Variables & Data Types
Shell scripts store values in variables that can hold strings, integers, or arrays. Unlike compiled languages, all shell variables are untyped by default. Understanding variable scoping, quoting rules, and special variables like `$?` (exit code), `$0` (script name), `$@` (all arguments) is the foundation of shell scripting.

#### Conditionals
Conditionals allow scripts to make decisions based on file existence, string comparisons, numeric comparisons, or command exit codes. The `if/elif/else` construct and `case` statement are the two primary conditional structures in Bash.

#### Loops
Loops allow repetitive execution of commands. `for` loops iterate over lists or ranges, `while` loops run as long as a condition is true, and `until` loops run until a condition becomes true. Understanding loop control (`break`, `continue`) enables clean iteration logic.

#### Functions
Functions group reusable blocks of commands under a name. They accept arguments, can return exit codes, and support local variable scoping. Writing functions makes scripts modular, testable, and easier to maintain.

#### Input Handling
Scripts often need to accept user input either interactively via `read` or via command-line arguments. The `getopts` built-in enables parsing of named flags and options, making scripts behave more like standard Unix tools.

#### String Manipulation & Regex
Bash provides powerful built-in string operations for extracting substrings, replacing patterns, and checking lengths. Combined with `sed`, `awk`, `grep`, and `cut`, complex text processing can be done entirely within shell scripts without additional dependencies.

#### File Operations & I/O Redirection
Shell scripts frequently read from and write to files. Understanding standard input, output, and error streams, as well as how to redirect them using `>`, `>>`, `<`, `2>&1`, and pipes (`|`), is essential for building robust scripts.

#### Error Handling
Production scripts must handle failures gracefully. `set -e` causes the script to exit on any non-zero return code, `set -x` enables debug tracing, and `trap` allows cleanup actions when the script exits or receives a signal. These tools prevent silent failures and data corruption.

#### Script Debugging
Debugging shell scripts involves enabling trace mode, using `echo` or `printf` for intermediate output, running scripts with `bash -x`, and using external tools like `shellcheck` to catch syntax errors and common mistakes before execution.

#### Real-World Script Examples
Practical shell scripting experience comes from writing automation for common tasks: automated backups, log rotation and parsing, system health checks, user provisioning, disk usage alerts, and deployment rollback scripts. These scenarios reinforce all scripting concepts in a production-relevant context.

---

## Module 2: AWS Core Services

### 2.1 IAM (Identity & Access Management)

#### Users, Groups, Roles & Policies
IAM is the access control layer for all AWS services. Users represent individual identities, groups aggregate users for shared permissions, and roles are assumed by services or users temporarily. Policies are JSON documents that define what actions are allowed or denied on which resources.

#### Policy Types
AWS supports three policy types. AWS Managed policies are maintained by Amazon and cover common use cases. Customer Managed policies are created and controlled by you. Inline policies are embedded directly into a user, group, or role and are deleted with it. Understanding when to use each type is key to maintainable access control.

#### Trust Policies & Resource-Based Policies
Trust policies define which principals (users, services, accounts) are allowed to assume a role. Resource-based policies are attached directly to resources like S3 buckets or SQS queues and define who can access them, including cross-account access without role assumption.

#### STS & Temporary Credentials
AWS Security Token Service issues short-lived credentials when a role is assumed. This is the foundation for secure, time-limited access — used by EC2 instance profiles, Lambda functions, federated users, and cross-account access. Temporary credentials reduce the risk of long-term key exposure.

#### IAM Best Practices
The principle of least privilege means granting only the permissions needed for a task. Best practices include never using the root account for daily operations, enforcing MFA, rotating access keys, using roles instead of long-term keys, and regularly auditing permissions with IAM Access Analyzer.

#### Cross-Account Access
Organizations often span multiple AWS accounts for isolation and billing. Cross-account access is achieved by creating a role in the target account with a trust policy that allows the source account's principals to assume it — avoiding the need to create duplicate IAM users across accounts.

---

### 2.2 EC2 (Elastic Compute Cloud)

#### Instance Types & Families
EC2 instances are categorized into families based on their primary use case. General purpose instances balance compute, memory, and network. Compute-optimized instances are for CPU-intensive workloads. Memory-optimized instances suit databases and caching. Storage-optimized instances are for high-throughput disk I/O. Selecting the right instance type directly impacts performance and cost.

#### AMI (Amazon Machine Image)
An AMI is a snapshot of an EC2 instance that includes the OS, installed software, and configuration. AMIs enable consistent, repeatable instance launches. Custom AMIs built from golden images reduce boot time and configuration drift in auto-scaling environments.

#### User Data & Instance Metadata
User data is a script that runs once when an instance first launches, typically used for bootstrapping — installing packages, pulling configuration, or starting services. The instance metadata service provides runtime information to the instance such as its instance ID, IP address, IAM role credentials, and tags.

#### Placement Groups
Placement groups control the physical placement of instances within AWS infrastructure. Cluster placement groups pack instances together on the same hardware for low-latency, high-throughput networking. Spread groups separate instances across distinct hardware to reduce correlated failure risk. Partition groups divide instances into logical partitions that don't share underlying hardware.

#### Auto Scaling Groups
Auto Scaling Groups automatically adjust the number of EC2 instances based on demand. Launch templates define instance configuration, and scaling policies define when to add or remove instances — based on CPU utilization, custom metrics, or schedules. Lifecycle hooks allow custom actions during scale-in and scale-out events.

#### EC2 Purchasing Options
AWS offers multiple pricing models. On-Demand instances are billed per second with no commitment. Reserved Instances offer discounts for 1 or 3-year commitments. Spot Instances use unused AWS capacity at up to 90% discount but can be interrupted. Savings Plans offer flexibility across instance types. Choosing the right mix significantly impacts infrastructure cost.

---

### 2.3 EBS (Elastic Block Store)

#### Volume Types
EBS offers multiple volume types optimized for different workloads. `gp3` is the default general-purpose SSD suitable for most applications. `io2` is for I/O-intensive databases requiring high IOPS with durability guarantees. `st1` and `sc1` are HDD volumes for sequential, throughput-heavy workloads at lower cost.

#### Snapshots & Lifecycle Management
EBS snapshots are incremental point-in-time backups stored in S3. Only changed blocks are saved after the first snapshot, making them storage-efficient. The Data Lifecycle Manager (DLM) automates snapshot creation, retention, and deletion based on policies.

#### Encryption
EBS volumes can be encrypted at rest using AWS KMS keys. Encryption covers the volume data, snapshots, and any data in transit between the volume and the instance. It is transparent to the application — no code changes are needed.

#### Performance Tuning
EBS performance is measured in IOPS and throughput. `gp3` allows independent configuration of IOPS and throughput. Proper volume sizing, using RAID configurations, and enabling EBS-optimized instances ensure the storage layer is never a bottleneck.

---

### 2.4 EFS (Elastic File System)

#### EFS Overview & Comparison
EFS is a fully managed, scalable NFS file system for use with EC2 and containers. Unlike EBS, which is attached to a single instance, EFS can be mounted simultaneously by thousands of instances across multiple Availability Zones. It is ideal for shared storage use cases like content management, home directories, and application data.

#### Performance & Throughput Modes
EFS offers two performance modes. General Purpose mode is optimized for latency-sensitive workloads. Max I/O mode supports higher aggregate throughput for massively parallel workloads at the cost of slightly higher latency. Throughput can be bursting (based on stored data), provisioned (fixed), or elastic (auto-scales with demand).

#### EFS Access Points
Access Points are application-specific entry points into an EFS file system that enforce a specific POSIX user identity and root directory. They enable multiple applications or teams to share a single file system with proper isolation and permissions.

#### EFS with EKS
EFS is commonly used in Kubernetes for workloads requiring shared `ReadWriteMany` storage. The EFS CSI Driver allows Kubernetes pods to dynamically provision and mount EFS volumes through standard PersistentVolumeClaim objects.

---

### 2.5 S3 (Simple Storage Service)

#### Buckets, Policies & Access Control
S3 stores objects in buckets. Access is controlled through bucket policies (resource-based), IAM policies (identity-based), and ACLs. The Block Public Access setting is a safeguard that overrides any configuration that would make data publicly accessible — critical for preventing data exposure.

#### Storage Classes
S3 offers tiered storage classes to optimize cost based on access frequency. Standard is for frequently accessed data. Standard-IA and One Zone-IA are for infrequent access. Glacier tiers are for archival with retrieval times ranging from milliseconds to hours. Intelligent-Tiering automatically moves objects between tiers based on access patterns.

#### Versioning & MFA Delete
Versioning preserves every version of an object, enabling recovery from accidental deletions or overwrites. MFA Delete requires multi-factor authentication to permanently delete a version or disable versioning — adding an extra layer of protection for critical data.

#### Lifecycle Policies
Lifecycle rules automate the transition of objects between storage classes and their eventual expiration. For example, logs can automatically move to Glacier after 30 days and be deleted after 365 days, reducing storage costs without manual intervention.

#### Replication
Cross-Region Replication (CRR) copies objects to a bucket in a different region for disaster recovery or compliance. Same-Region Replication (SRR) copies within the same region for log aggregation or test environment data synchronization. Replication is asynchronous and does not affect the source bucket's performance.

#### S3 Encryption
S3 supports multiple encryption options. SSE-S3 uses AWS-managed keys transparently. SSE-KMS uses customer-managed KMS keys with audit trails. SSE-C uses customer-provided keys, where AWS does the encryption but never stores the key. Client-side encryption means data is encrypted before it reaches S3.

#### S3 Event Notifications
S3 can trigger events when objects are created, deleted, or restored. These events can invoke Lambda functions, send messages to SQS queues, or publish to SNS topics — enabling event-driven architectures for image processing, ETL pipelines, and data ingestion workflows.

#### Presigned URLs
A presigned URL grants temporary access to a private S3 object without requiring AWS credentials. It embeds authentication information in the URL itself with an expiry time. This is commonly used to give users direct, time-limited download or upload access to specific objects.

---

### 2.6 RDS (Relational Database Service)

#### Supported Engines & Use Cases
RDS supports MySQL, PostgreSQL, MariaDB, Oracle, SQL Server, and Aurora. Choosing the right engine depends on licensing requirements, compatibility with existing applications, and performance characteristics. Aurora is AWS's cloud-native engine offering superior performance and availability compared to standard MySQL and PostgreSQL.

#### Multi-AZ Deployments
In Multi-AZ mode, RDS maintains a synchronous standby replica in a different Availability Zone. If the primary instance fails, RDS automatically fails over to the standby with minimal downtime. This is the standard approach for production database high availability.

#### Read Replicas
Read Replicas are asynchronous copies of the primary database that serve read traffic. They reduce load on the primary instance and can be promoted to standalone instances for disaster recovery. Cross-region read replicas provide geographic distribution and DR capabilities.

#### Automated Backups & Point-in-Time Recovery
RDS automatically takes daily snapshots and captures transaction logs, enabling point-in-time recovery to any second within the retention window (up to 35 days). This is the primary data recovery mechanism and requires no operational overhead.

#### RDS Proxy
RDS Proxy sits between your application and the database, pooling and sharing database connections. It reduces the overhead of opening and closing connections, which is critical for serverless workloads (Lambda) that may open thousands of short-lived connections and overwhelm the database.

#### Aurora Architecture
Aurora separates compute from storage. Its distributed storage layer replicates data six ways across three Availability Zones automatically. Aurora Serverless v2 scales database capacity in fine-grained increments based on actual workload, making it cost-effective for variable traffic patterns.

---

### 2.7 Load Balancers

#### Application Load Balancer (ALB)
ALB operates at Layer 7 (HTTP/HTTPS) and makes routing decisions based on request content. It supports path-based routing, host-based routing, HTTP header conditions, and query string conditions. It is the standard choice for web applications and microservices, and integrates natively with EKS via the AWS Load Balancer Controller.

#### Network Load Balancer (NLB)
NLB operates at Layer 4 (TCP/UDP/TLS) and is designed for extreme performance and low latency. It can handle millions of requests per second, supports static IP addresses and Elastic IPs, and preserves the client's source IP. It is used for non-HTTP workloads, gaming, IoT, and financial trading applications.

#### Gateway Load Balancer (GLB)
GLB enables deployment of third-party network appliances such as firewalls, intrusion detection systems, and deep packet inspection tools at scale. It uses the GENEVE protocol to pass traffic transparently through virtual appliances without disrupting the source and destination flow.

#### Target Groups & Health Checks
Target groups define the destinations for routed traffic — EC2 instances, IP addresses, Lambda functions, or containers. Health checks determine which targets are healthy and eligible to receive traffic. Proper health check configuration prevents traffic from being sent to unhealthy instances.

#### SSL Termination & ACM
Load balancers can terminate SSL/TLS connections, offloading decryption from backend instances. AWS Certificate Manager (ACM) provides free SSL certificates that can be attached directly to load balancers, with automatic renewal handling.

---

### 2.8 VPC & Security Groups

#### VPC Architecture
A Virtual Private Cloud is your isolated network within AWS. You define the IP address range using CIDR notation and divide it into subnets. Public subnets have routes to the Internet Gateway for direct internet access. Private subnets use a NAT Gateway for outbound-only internet access. Isolated subnets have no internet connectivity at all.

#### Security Groups
Security groups are stateful virtual firewalls attached to EC2 instances and other resources. Being stateful means that if inbound traffic is allowed, the return traffic is automatically permitted. Rules specify allowed protocols, ports, and source/destination — but there is no deny rule; traffic not matching an allow rule is dropped.

#### Network ACLs
Network ACLs are stateless firewalls applied at the subnet level. Unlike security groups, they evaluate both inbound and outbound rules independently, and rules are processed in order. NACLs are useful for subnet-level blocking, such as denying a specific IP range.

#### VPC Peering & Transit Gateway
VPC Peering connects two VPCs privately without traversing the internet. It is non-transitive — if VPC A peers with B and B peers with C, A cannot communicate with C. Transit Gateway solves this by acting as a hub that any number of VPCs and on-premises networks connect to, enabling a full mesh without individual peering connections.

#### VPC Endpoints
VPC Endpoints allow private connectivity to AWS services without traffic leaving the Amazon network. Gateway Endpoints are used for S3 and DynamoDB. Interface Endpoints (powered by AWS PrivateLink) support most other services and create an ENI in your subnet with a private IP.

---

### 2.9 EKS (Elastic Kubernetes Service)

#### EKS Architecture
EKS is a managed Kubernetes service where AWS operates the control plane. The control plane components — API server, etcd, scheduler, and controller manager — run in AWS-managed infrastructure across multiple Availability Zones. You are responsible for worker nodes and the applications running on them.

#### Node Groups & Fargate
Managed Node Groups automate the provisioning and lifecycle of EC2 worker nodes. Self-managed nodes give full control over instance configuration. Fargate is a serverless option where AWS provisions individual pods on isolated compute without any node management — ideal for batch workloads and simplifying operations.

#### IRSA (IAM Roles for Service Accounts)
IRSA allows Kubernetes pods to assume IAM roles at the pod level using OIDC federation. This eliminates the need to attach IAM roles to entire EC2 nodes, following the principle of least privilege. Each application gets exactly the AWS permissions it needs, and nothing more.

#### EKS Addons & Integrations
EKS addons manage the lifecycle of critical cluster components like VPC CNI (pod networking), CoreDNS (cluster DNS), kube-proxy (service networking), and EBS/EFS CSI Drivers (persistent storage). AWS manages their versions and patches them in sync with Kubernetes version upgrades.

#### Cluster Autoscaler & Karpenter
Cluster Autoscaler adjusts the number of nodes based on pending pods. Karpenter is AWS's next-generation node provisioner that directly provisions the right-sized instances for pending pods in seconds, with better cost optimization through Spot integration and bin-packing.

---

## Module 3: Git & Version Control

### 3.1 Git Internals

#### Object Model
Git stores all data as objects in a content-addressable store. Blobs store file contents, trees represent directory structures, commits point to trees and record history, and tags are named references to specific commits. Understanding this model explains why Git operations are fast and why history is immutable.

#### The `.git` Directory
The `.git` directory is the heart of every repository. It contains the object database, references (branches and tags), the index (staging area), and configuration. Understanding its structure helps diagnose repository issues and understand how Git commands manipulate internal state.

---

### 3.2 Branching Strategies

#### Git Flow
Git Flow defines a strict branching model with dedicated branches for features, releases, and hotfixes. It is well-suited for projects with scheduled releases and multiple supported versions. The overhead of maintaining multiple long-lived branches makes it less ideal for teams practicing continuous delivery.

#### Trunk-Based Development
All developers commit to a single shared branch (trunk/main) multiple times per day. Feature flags are used to hide incomplete features in production. This strategy reduces merge conflicts and integration debt, and is the foundation of true continuous integration.

#### GitHub Flow
A simplified model where developers create short-lived feature branches off main and merge via pull requests. There are no release branches — main is always deployable. It strikes a balance between structure and simplicity and is the most widely adopted workflow for web applications.

---

### 3.3 Advanced Git Operations

#### Merge vs Rebase vs Squash
Merge creates a merge commit preserving the full branch history. Rebase replays commits on top of another branch, creating a linear history. Squash compresses multiple commits into one before merging. Each approach has trade-offs between history clarity and commit granularity.

#### Cherry-Pick
Cherry-pick applies a specific commit from one branch onto another without merging the entire branch. It is useful for backporting bug fixes to release branches or selectively applying changes across branches.

#### Git Bisect
Git bisect uses binary search to find the commit that introduced a bug. You mark a known-good commit and a known-bad commit, and Git checks out the midpoint. After testing, you mark it good or bad, and Git narrows the search until the culprit commit is identified.

#### Git Hooks
Hooks are scripts that run automatically at specific points in the Git workflow. `pre-commit` runs before a commit is created and is commonly used for linting and formatting. `post-merge` runs after a merge and can be used to install dependencies. Hooks are stored in `.git/hooks` or managed by tools like Husky.

#### Monorepo vs Multi-Repo
A monorepo stores all projects and services in a single repository, enabling atomic commits across services and simplified dependency management. A multi-repo approach gives each service its own repository for independent versioning and access control. The right choice depends on team size, coupling between services, and tooling maturity.

---

## Module 4: Jenkins

### 4.1 Installation & Configuration

#### Jenkins Installation on Linux
Jenkins is distributed as a Java application available as a system package, WAR file, or Docker image. Installing via the official package repository on Linux ensures integration with `systemctl` for service management and automatic updates through the package manager.

#### JENKINS_HOME & Directory Structure
`JENKINS_HOME` is the root directory where Jenkins stores all its state — job configurations, build history, plugins, credentials, and workspace data. Understanding its layout is essential for backup, restore, and migration operations.

#### Plugin Management
Jenkins functionality is extended through plugins. The Plugin Manager handles installation, updates, and dependency resolution. Critical plugins include those for Git integration, pipeline support, Docker, Kubernetes agents, credentials management, and notification systems.

#### Security Configuration
Jenkins supports multiple security realms — built-in user database, LDAP, and Active Directory. Authorization strategies range from simple anyone-can-do-anything (for trusted internal environments) to Matrix-based security that grants granular per-user or per-group permissions on specific jobs and resources.

#### Credentials Management
Jenkins provides a centralized credentials store for secrets — API tokens, SSH keys, username/password pairs, and certificates. Credentials are referenced by ID in pipelines using the `withCredentials` wrapper, ensuring secrets are never exposed in console output or logs.

---

### 4.2 Freestyle Jobs

#### Job Configuration
Freestyle jobs are the basic unit of work in Jenkins. They are configured through a web form and are suitable for simple build and deployment tasks. Key configuration areas include source code management, build triggers, build environment, build steps, and post-build actions.

#### SCM Integration & Webhooks
Jenkins can poll a Git repository for changes on a schedule or receive webhook notifications for immediate triggering. Webhooks are preferred in production as they reduce unnecessary polling load and trigger builds within seconds of a code push.

#### Parameterized Builds
Parameters allow the same job to behave differently based on user input at runtime — for example, selecting a target environment or specifying a version number. Parameter types include string, choice, boolean, file, and password, each surfaced in the Jenkins UI when triggering a build.

#### Build Artifacts & Reports
Post-build actions define what happens after the build completes. Archiving artifacts preserves build outputs for later use or deployment. Publishing JUnit test results renders test pass/fail trends over time. Notification integrations send build results to email, Slack, or other channels.

---

### 4.3 Pipeline (Groovy Scripting)

#### Declarative vs Scripted Pipeline
Declarative Pipeline provides a simplified, structured syntax defined within a `pipeline {}` block with enforced sections for agents, stages, and post actions. It is opinionated and easier to read. Scripted Pipeline is raw Groovy code offering maximum flexibility for complex logic but with less guardrails. Declarative is the recommended starting point.

#### Jenkinsfile & Pipeline as Code
A `Jenkinsfile` stored in the repository alongside application code is the cornerstone of pipeline as code. It versions the build process with the application, enables peer review of pipeline changes, and allows the pipeline to be restored from source control after a Jenkins failure.

#### Environment Variables & Credentials
Environment variables are available throughout the pipeline — both Jenkins built-ins (like `BUILD_NUMBER`, `JOB_NAME`) and custom ones defined in the `environment {}` block. The `withCredentials` step injects secrets from the credentials store as environment variables, masking them in all console output.

#### Shared Libraries
Shared Libraries allow common pipeline logic to be extracted into a separate repository and reused across multiple `Jenkinsfile`s. They follow a specific directory structure with `vars/` for callable steps and `src/` for Groovy classes. This eliminates duplication and allows centralized pipeline governance.

#### Parallel Stages
The `parallel` directive runs multiple stages simultaneously within a single pipeline stage, reducing total build time. Common use cases include running unit tests, integration tests, and code analysis concurrently, or building Docker images for multiple architectures at the same time.

#### Input Step & Manual Approvals
The `input` step pauses the pipeline and waits for a human to approve or abort before proceeding. This is the standard mechanism for gating deployments to production environments, ensuring a human reviews the build before it goes live.

#### Groovy Scripting in Pipelines
The `script {}` block inside a Declarative Pipeline allows arbitrary Groovy code — variables, conditionals, loops, and function calls. This is used for dynamic behavior like conditionally setting variables, iterating over a list of environments to deploy to, or parsing build output.

---

### 4.4 Master-Slave (Controller-Agent) Architecture

#### Controller Responsibilities
The Jenkins controller manages the build queue, schedules jobs on available agents, stores configuration and history, hosts the web UI, and coordinates plugin operations. It should not execute builds directly in production, reserving its resources for orchestration.

#### Agent Types & Connection Methods
Agents are worker machines that execute the actual build steps. They connect to the controller via SSH (controller-initiated) or JNLP (agent-initiated). Docker agents run builds inside containers for isolation. Kubernetes agents dynamically spin up pods as build agents and terminate them when the build completes.

#### Node Labels & Executors
Labels are tags assigned to agents that pipelines use to route builds to the right node — for example, routing Docker builds to a Linux node with Docker installed. Executors define how many concurrent builds a node can run. Proper labeling and executor configuration maximizes resource utilization.

#### Cloud Agents & Dynamic Provisioning
The EC2 plugin dynamically provisions EC2 instances as Jenkins agents when build demand exceeds available capacity and terminates them when idle, optimizing cost. The Kubernetes plugin does the same with pods, making Jenkins natively elastic in container environments.

---

## Module 5: Docker

### 5.1 Docker Architecture

#### Container vs Virtual Machine
Containers share the host OS kernel, making them lightweight and fast to start. Virtual machines include a full OS guest, consuming significantly more resources. Containers provide process-level isolation using Linux namespaces and cgroups. VMs provide hardware-level isolation with a hypervisor. Containers are ideal for packaging and running microservices.

#### Docker Components
The Docker daemon (`dockerd`) runs on the host and manages images, containers, networks, and volumes. The Docker CLI client communicates with the daemon via a REST API. The registry (Docker Hub or a private registry like ECR) stores and distributes images. Together these three components form the core Docker platform.

#### Image Layers & Union File System
Docker images are built from layers, where each instruction in a Dockerfile creates a new read-only layer. Layers are cached and shared between images, saving disk space and speeding up builds. When a container runs, a thin writable layer is added on top — containers share the read-only image layers underneath.

---

### 5.2 Docker Commands

#### Image Management
Image management commands handle the full lifecycle of Docker images — pulling from registries, building from Dockerfiles, tagging for different registries or versions, pushing to remote registries, listing locally cached images, removing unused images, and inspecting image metadata and layer history.

#### Container Lifecycle
Container lifecycle commands cover creating, starting, stopping, restarting, and removing containers. The `exec` command allows running additional processes inside a running container for debugging. The `logs` command streams container output, and `stats` provides real-time resource consumption metrics.

#### Network & Volume Commands
Network commands create and manage Docker networks that containers communicate over. Volume commands manage named volumes for persistent data. These objects are independent of containers and persist after containers are removed, unless explicitly deleted.

#### Cleanup Commands
Over time, stopped containers, unused images, dangling volumes, and unused networks accumulate and consume disk space. The `docker system prune` command removes all unused objects. `docker system df` shows disk usage broken down by images, containers, and volumes.

---

### 5.3 Dockerfile

#### Dockerfile Instructions
A Dockerfile is a text file containing sequential instructions to build a Docker image. Each instruction creates a new layer. `FROM` specifies the base image. `RUN` executes commands during build. `COPY` and `ADD` bring files into the image. `ENV` sets environment variables. `EXPOSE` documents network ports. `CMD` and `ENTRYPOINT` define the default command.

#### CMD vs ENTRYPOINT
`ENTRYPOINT` defines the fixed executable that always runs when the container starts. `CMD` provides default arguments to `ENTRYPOINT` or a default command if no `ENTRYPOINT` is set. When used together, `CMD` arguments can be overridden at runtime while `ENTRYPOINT` remains fixed, giving containers a well-defined interface.

#### Layer Caching & Optimization
Docker caches each layer and reuses it if the instruction and its inputs have not changed. Ordering instructions from least to most frequently changed maximizes cache reuse — for example, copying dependency files and installing packages before copying source code ensures the dependency installation layer is cached across code changes.

#### .dockerignore
The `.dockerignore` file excludes files and directories from the build context sent to the Docker daemon. Excluding `node_modules`, `.git`, test files, and local configuration reduces build context size, speeds up builds, and prevents sensitive local files from being accidentally included in images.

---

### 5.4 Multistage Builds

#### What Are Multistage Builds
Multistage builds use multiple `FROM` statements in a single Dockerfile, each defining a distinct stage. Stages can copy artifacts from each other. The key benefit is that the final image only contains what is needed to run the application — not the build tools, compilers, or test dependencies used during the build process.

#### Why Multistage Builds Matter
Without multistage builds, production images include compilers, build tools, and development dependencies that dramatically increase image size and attack surface. A compiled Go application that requires a full Go toolchain to build can produce a final image that contains only the static binary — often reducing image size by 90% or more.

#### Targeting Specific Stages
Individual stages can be targeted with `docker build --target <stage>`. This allows the same Dockerfile to serve multiple purposes — building just the test stage in CI for running tests, and building the production stage for deployment. It eliminates the need for separate Dockerfiles for different purposes.

---

### 5.5 Docker Volumes & Storage

#### Named Volumes
Named volumes are the recommended mechanism for persisting container data. Docker manages their lifecycle, storage location, and backup. They can be created explicitly or automatically when a container references a non-existent volume name. Named volumes are independent of any specific container and can be shared between containers.

#### Bind Mounts
Bind mounts map a specific host file system path into a container. They are primarily used during development to mount source code into a container for live reloading, and for injecting configuration files into containers at runtime. Bind mounts are tightly coupled to the host directory structure.

#### Volume Drivers
The default local volume driver stores data on the host file system. Third-party volume drivers enable storing data on NFS shares, AWS EFS, Azure File Storage, or other network-attached storage, allowing volumes to persist beyond the lifecycle of any individual host machine.

#### Backup & Restore Strategies
Backing up named volumes involves running a temporary container that mounts the volume and archives its contents to a tarball, which can be stored in S3 or another backup location. Restoration reverses the process. Documenting and automating these procedures is essential for production data protection.

---

### 5.6 Docker Networking

#### Bridge Network
The default bridge network connects containers on the same host. User-defined bridge networks provide automatic DNS resolution between containers by name, making service discovery simple in multi-container applications. Containers on different user-defined networks cannot communicate by default.

#### Host Network
Host networking removes network isolation between the container and the host. The container shares the host's network stack directly. This offers maximum network performance but eliminates port mapping — the container's ports are directly the host's ports. Used for performance-critical applications and network monitoring tools.

#### Overlay Network
Overlay networks enable communication between containers running on different Docker hosts. They are the foundation of Docker Swarm networking, creating a distributed network that spans multiple machines. Overlay networking uses VXLAN encapsulation to tunnel container traffic between hosts.

---

### 5.7 Docker Compose

#### Compose Overview
Docker Compose defines and manages multi-container applications using a YAML file. It describes all services, their build contexts or images, environment variables, port mappings, volume mounts, networks, and dependency ordering in a single declarative file. `docker compose up` starts the entire application stack with one command.

#### Service Dependencies & Health Checks
The `depends_on` directive controls startup order between services. With health check conditions, Docker Compose waits until a dependent service's health check passes before starting the next service. This prevents application containers from starting before their database is fully ready.

#### Environment Variables & Overrides
Environment variables can be defined inline, read from `.env` files, or passed from the host shell. Compose supports override files (e.g., `docker-compose.override.yml`) that merge with the base file — a pattern used to maintain separate configurations for development, staging, and production without duplicating the entire file.

---

## Module 6: Kubernetes (CKA Complete)

### 6.1 Cluster Architecture

#### Control Plane Components
The API Server is the front-end for the Kubernetes control plane — all operations go through it. etcd is the distributed key-value store that holds all cluster state. The Scheduler assigns pods to nodes based on resource availability and constraints. The Controller Manager runs control loops that reconcile the desired state with the actual state of the cluster.

#### Worker Node Components
The kubelet is an agent on every worker node that ensures containers described in pod specs are running and healthy. kube-proxy maintains network rules on nodes to implement Service abstractions. The Container Runtime Interface (CRI) is the plugin layer that connects to container runtimes like containerd or CRI-O.

---

### 6.2 Core Workloads

#### Pods
A Pod is the smallest deployable unit in Kubernetes, representing one or more containers that share a network namespace, storage, and lifecycle. Containers within a pod communicate over localhost. Multi-container pod patterns include sidecar (enhancing the main container), ambassador (proxying), and adapter (transforming output).

#### ReplicaSets & Deployments
A ReplicaSet ensures a specified number of identical pod replicas are running at all times, replacing failed pods automatically. Deployments manage ReplicaSets and add rolling update and rollback capabilities. Deployments are the standard way to run stateless applications in Kubernetes.

#### StatefulSets
StatefulSets manage stateful applications where each pod needs a stable, unique network identity and persistent storage. Unlike Deployments, pods are created and deleted in a predictable order with consistent names (e.g., `web-0`, `web-1`). They are used for databases, message queues, and other stateful workloads.

#### DaemonSets
A DaemonSet ensures that a specific pod runs on every node (or a subset of nodes) in the cluster. As nodes are added to the cluster, pods are automatically added to them. DaemonSets are used for cluster-wide services like log collectors, monitoring agents, and network plugins.

#### Jobs & CronJobs
Jobs create one or more pods to perform a finite task and track successful completions. They ensure the task runs to completion even if pods fail. CronJobs create Jobs on a recurring schedule using cron syntax, used for database backups, report generation, and scheduled cleanup tasks.

---

### 6.3 Scheduling

#### Node Selector & Node Affinity
Node Selector is a simple mechanism to constrain pods to nodes with specific labels. Node Affinity is a more expressive replacement that supports required and preferred rules, multiple label conditions, and operators like `In`, `NotIn`, `Exists`. Required rules prevent scheduling if no matching node exists; preferred rules try to match but fall back if needed.

#### Pod Affinity & Anti-Affinity
Pod Affinity schedules pods near other pods with specific labels — useful for co-locating services that communicate heavily. Pod Anti-Affinity spreads pods away from each other — the standard approach for ensuring Deployment replicas land on different nodes or Availability Zones for high availability.

#### Taints & Tolerations
Taints mark a node as unsuitable for general pod placement. Only pods with matching Tolerations can be scheduled on tainted nodes. This mechanism is used to reserve nodes for specific workloads (e.g., GPU nodes, high-memory nodes) or to mark nodes as unschedulable during maintenance.

#### Resource Requests & Limits
Requests define the minimum resources (CPU, memory) a pod needs — used by the Scheduler to find a suitable node. Limits define the maximum a pod can consume — enforced at runtime by the container runtime. Setting both prevents resource starvation and ensures fair sharing across workloads.

#### LimitRange & ResourceQuota
LimitRange sets default resource requests and limits for pods and containers in a namespace, preventing under-specified workloads from consuming unbounded resources. ResourceQuota caps the total resource consumption for an entire namespace, enabling multi-tenant cluster sharing with guaranteed isolation.

---

### 6.4 Services & Networking

#### ClusterIP Service
ClusterIP is the default Service type that exposes a stable internal IP address and DNS name for a set of pods. It is only reachable within the cluster. It load-balances traffic across healthy pods matching its selector, providing a stable endpoint even as pod IPs change due to restarts and rescheduling.

#### NodePort & LoadBalancer Services
NodePort opens a specific port on every node in the cluster and forwards traffic to the Service. LoadBalancer provisions a cloud load balancer that routes external traffic to NodePort and then to the pods. LoadBalancer is the standard way to expose applications to the internet in cloud environments.

#### Ingress & Ingress Controllers
An Ingress resource defines HTTP and HTTPS routing rules — routing traffic to different Services based on hostname or URL path. An Ingress Controller is a pod that watches for Ingress resources and configures a load balancer (NGINX, ALB, Traefik) accordingly. Ingress consolidates external access through a single entry point.

#### DNS in Kubernetes (CoreDNS)
CoreDNS is the cluster DNS server. Every Service gets a DNS name in the format `<service>.<namespace>.svc.cluster.local`. Every pod gets a DNS name based on its IP. Applications use these DNS names for service discovery, eliminating hardcoded IP addresses.

#### NetworkPolicy
NetworkPolicy is a specification for how groups of pods can communicate with each other and external endpoints. By default, all pods can communicate freely. Applying a NetworkPolicy enables microsegmentation — for example, allowing only the frontend to reach the backend and only the backend to reach the database.

---

### 6.5 Storage

#### Persistent Volumes & Persistent Volume Claims
A PersistentVolume (PV) is a piece of storage in the cluster provisioned by an admin or dynamically. A PersistentVolumeClaim (PVC) is a request for storage by a pod. The binding between a PVC and a PV is the Kubernetes abstraction that decouples pod configuration from specific storage implementation details.

#### Storage Classes & Dynamic Provisioning
StorageClasses describe different types of storage (fast SSD, slow HDD, replicated, etc.) and their provisioning parameters. When a PVC references a StorageClass, Kubernetes dynamically provisions a PV matching the requested capacity and access mode. This eliminates manual pre-provisioning of storage.

#### Access Modes
ReadWriteOnce (RWO) allows mounting by a single node for read and write. ReadOnlyMany (ROX) allows multiple nodes to mount the volume read-only. ReadWriteMany (RWX) allows multiple nodes to mount for read and write simultaneously. Not all storage backends support all access modes — EBS supports RWO, EFS supports RWX.

#### Volume Snapshots
Volume Snapshots provide a standard Kubernetes API for taking point-in-time snapshots of persistent volumes. They use the CSI snapshot controller and driver to create snapshots in the underlying storage system. Snapshots can be used to create new volumes pre-populated with data.

---

### 6.6 Security

#### RBAC (Role-Based Access Control)
RBAC controls who can perform what actions on which resources. Roles define permissions within a namespace. ClusterRoles define permissions cluster-wide. RoleBindings and ClusterRoleBindings associate roles with subjects (Users, Groups, ServiceAccounts). Proper RBAC design is fundamental to cluster security.

#### Service Accounts
Every pod runs with a Service Account identity. ServiceAccounts are Kubernetes objects that provide an identity for processes running in pods. They are used for RBAC authorization within the cluster and, with IRSA or Workload Identity, for authenticating to cloud provider APIs.

#### Security Contexts
A Security Context defines privilege and access control settings for a pod or container — running as a non-root user, preventing privilege escalation, using a read-only root filesystem, and setting Linux capabilities. Security contexts are the primary mechanism for implementing container security hardening.

#### Pod Security Admission
Pod Security Admission enforces the Kubernetes Pod Security Standards at the namespace level. Three profiles exist: Privileged (no restrictions), Baseline (minimal restrictions), and Restricted (heavily hardened). Namespaces are labeled to enforce, warn, or audit against a chosen profile.

#### Secrets Management
Kubernetes Secrets store sensitive data like passwords, tokens, and keys. By default, Secrets are base64-encoded in etcd, not encrypted. Enabling encryption at rest with a KMS provider ensures Secrets are encrypted before being written to etcd, protecting them from direct storage access.

---

### 6.7 Cluster Maintenance

#### etcd Backup & Restore
etcd is the single source of truth for all cluster state. Regular etcd backups are critical — a snapshot captures the complete cluster state at a point in time. Restore involves stopping the API server, restoring the snapshot to a new data directory, and restarting etcd and the control plane.

#### Node Drain & Cordon
Cordoning marks a node as unschedulable, preventing new pods from being assigned to it. Draining evicts all pods from a node gracefully before maintenance. After maintenance, uncordoning makes the node schedulable again. These operations allow zero-downtime node upgrades and hardware replacement.

#### Cluster Upgrades with kubeadm
Kubernetes upgrades follow a process: first upgrade `kubeadm`, then apply the control plane upgrade, then upgrade each worker node one by one. Kubernetes supports upgrading one minor version at a time. Planning upgrades carefully — checking API deprecations and addon compatibility — prevents breaking changes.

#### Certificate Management
Kubernetes uses TLS certificates to secure all internal communication. Certificates have expiry dates (typically 1 year for kubeadm clusters). `kubeadm certs check-expiration` shows expiry dates. `kubeadm certs renew` renews all certificates. Failing to renew certificates will cause the cluster to stop functioning.

---

### 6.8 Observability & Troubleshooting

#### Probes (Liveness, Readiness, Startup)
Liveness probes detect when a container is stuck in a broken state and trigger an automatic restart. Readiness probes detect when a container is ready to serve traffic — pods failing readiness checks are removed from Service endpoints. Startup probes give slow-starting containers time to initialize before liveness checks begin.

#### kubectl Troubleshooting Workflow
Effective Kubernetes troubleshooting follows a structured flow — checking pod status and events with `kubectl describe`, examining container logs with `kubectl logs`, inspecting resource configuration with `kubectl get -o yaml`, and verifying service endpoints with `kubectl get endpoints`. Understanding what each state (Pending, CrashLoopBackOff, OOMKilled) indicates narrows the investigation.

#### Metrics Server & Resource Monitoring
Metrics Server collects CPU and memory metrics from kubelets and exposes them via the Kubernetes Metrics API. `kubectl top pods` and `kubectl top nodes` use this data for real-time resource visibility. The Horizontal Pod Autoscaler also consumes these metrics to make scaling decisions.

---

### 6.9 kubeadm Cluster Setup

#### Control Plane Initialization
`kubeadm init` bootstraps the Kubernetes control plane on the designated master node. It generates certificates, configures the API server, installs control plane components as static pods, and outputs the join command for worker nodes. The cluster is not functional until a CNI plugin is installed.

#### Worker Node Join
Worker nodes join the cluster using a join command that includes a bootstrap token and the CA certificate hash from the control plane. The kubelet on the worker node uses these credentials to authenticate with the API server and register the node.

#### High Availability Setup
An HA control plane requires at least three master nodes to maintain etcd quorum. The stacked etcd topology runs etcd on the same nodes as the control plane components. The external etcd topology runs etcd on separate dedicated nodes for improved isolation. A load balancer fronts the API servers, providing a stable endpoint for clients.

---

## Module 7: Terraform Advanced

### 7.1 Core Concepts Review

#### State File & Remote Backends
The Terraform state file maps real infrastructure to configuration. Remote backends like S3 store state centrally so teams can collaborate. DynamoDB provides state locking, preventing simultaneous applies that could corrupt state. State should always be stored remotely in team environments and never committed to version control.

#### Provider Configuration & Versioning
Providers are plugins that interact with APIs (AWS, Azure, GCP, Kubernetes). Pinning provider versions with `~>` (compatible with) prevents unexpected breaking changes when providers release new versions. The `required_providers` block declares dependencies, and `terraform init` downloads the specified versions.

---

### 7.2 Advanced HCL

#### Dynamic Blocks
Dynamic blocks generate repeated nested configuration blocks programmatically from a variable or local value. Instead of duplicating multiple identical blocks with different values, a single dynamic block iterates over a collection, producing one nested block per item. Commonly used for security group rules, IAM statements, and listener rules.

#### for_each vs count
`count` creates N identical resources differentiated only by index. `for_each` creates resources keyed by a string (from a map or set), allowing each resource to have distinct configuration and enabling removal of individual resources without recreating all subsequent ones. `for_each` is preferred for most real-world use cases.

#### Conditional Expressions
Terraform's ternary operator allows configuration values to differ based on a condition — for example, selecting a large instance in production and a small instance in staging from a single configuration. Combined with `var.environment` or workspace-based variables, it enables environment-aware infrastructure from a single codebase.

#### Lifecycle Rules
The `lifecycle` block customizes resource replacement behavior. `create_before_destroy` creates a replacement before destroying the old resource, enabling zero-downtime changes. `prevent_destroy` protects critical resources like databases from accidental deletion. `ignore_changes` prevents Terraform from reverting out-of-band changes to specific attributes.

---

### 7.3 Modules

#### Module Structure & Purpose
Modules encapsulate a set of related resources into a reusable unit with a defined interface — input variables for configuration and output values for consuming downstream. Well-designed modules hide complexity and enforce organizational standards, allowing teams to provision infrastructure consistently without deep Terraform expertise.

#### Module Versioning & Pinning
Modules sourced from the Terraform Registry or Git repositories should be pinned to specific versions. Version pinning ensures that infrastructure deployments are reproducible and that module updates are adopted explicitly through code review rather than silently on the next apply.

#### Module Composition Patterns
Complex infrastructure is built by composing multiple modules — a root module for an environment that calls a VPC module, an EKS module, and an RDS module, passing outputs from one as inputs to another. This separation of concerns makes large infrastructure codebases navigable and testable.

---

### 7.4 State Management

#### Remote State & Data Source
The `terraform_remote_state` data source reads outputs from another Terraform state file. This is how cross-stack dependencies are managed — a networking stack creates a VPC and publishes its ID as an output, and an application stack reads that output to place resources in the correct VPC without hardcoding IDs.

#### State Manipulation Commands
The `terraform state` subcommand allows direct manipulation of state. `state mv` renames resources in state without destroying them, used when refactoring module structure. `state rm` removes resources from state without destroying the real infrastructure. `import` brings existing resources under Terraform management.

#### Workspace Management
Workspaces allow multiple state files from the same configuration, enabling the same code to manage multiple environments (dev, staging, prod). Each workspace has its own state file. However, workspaces are not a complete environment isolation strategy — directory-based separation is often preferred for strict environment isolation.

---

### 7.5 Terraform in CI/CD

#### Terraform Pipeline Stages
A standard Terraform CI/CD pipeline consists of initialization, format check, validation, plan, and conditional apply. The plan is generated against the target environment and its output is stored as an artifact for human review. Apply is gated behind a manual approval step in production to prevent unreviewed changes from being applied.

#### Secrets Management in Pipelines
Terraform configurations often need to authenticate with cloud providers and handle sensitive variable values. In CI/CD pipelines, credentials are injected as environment variables from a secrets manager (AWS Secrets Manager, HashiCorp Vault, Jenkins credentials) rather than stored in Terraform variable files or version control.

#### Atlantis for GitOps
Atlantis is an open-source tool that runs `terraform plan` on pull requests and posts the plan as a comment. Team members review the planned changes as part of the code review process, and an authorized reviewer comments `atlantis apply` to trigger the apply. This brings the full GitOps workflow to Terraform.

---

### 7.6 Advanced Patterns

#### Terragrunt
Terragrunt is a thin wrapper around Terraform that solves the DRY problem for backend configuration and provider blocks that are duplicated across many environments and modules. It allows a single root `terragrunt.hcl` to define remote state configuration using dynamic expressions, with each module's terragrunt file inheriting it with minimal override.

#### Multi-Environment Strategy
Two primary patterns exist for managing multiple environments. Workspace-based uses a single directory with `terraform.workspace` to vary configuration. Directory-based uses separate directories per environment, each with its own state and variable files. Directory-based provides stronger isolation and is the preferred pattern for production-grade infrastructure.

#### Testing Terraform
Terraform code should be tested at multiple levels. `terraform validate` checks syntax and internal consistency. `terraform fmt` enforces formatting standards. The built-in `terraform test` framework (v1.6+) allows writing test cases that apply configuration to a real or mocked provider and assert against resource attributes. Terratest is a Go-based framework for full integration testing.

---

## Capstone Projects

### Project 1 — End-to-End CI/CD Pipeline
Provision an EKS cluster with Terraform, configure Jenkins on EC2 with a master-agent setup, write a full Declarative Pipeline that builds a Docker image with a multistage Dockerfile, pushes to ECR, and deploys to EKS using rolling updates with Kubernetes Deployments and an Ingress resource.

### Project 2 — Highly Available AWS Architecture
Design and provision a production-grade multi-AZ architecture using Terraform modules — including a custom VPC with public/private subnets, an Application Load Balancer with SSL termination, an Auto Scaling Group with a launch template, Aurora MySQL Multi-AZ, and an S3 bucket with lifecycle policies and CloudFront distribution.

### Project 3 — Kubernetes Production Cluster
Bootstrap an HA Kubernetes cluster using kubeadm with three control plane nodes and stacked etcd. Configure Calico CNI, implement RBAC with least-privilege roles for each application team, enforce NetworkPolicies for namespace isolation, deploy the EFS CSI driver for shared storage, and set up the Prometheus Operator with custom alerting rules.

### Project 4 — GitOps Infrastructure Platform
Build a fully modular Terraform codebase for a multi-account AWS organization covering networking, compute, and data tiers. Configure remote state with S3 and DynamoDB locking, set up Atlantis for PR-based plan and apply workflows, and implement Sentinel policies to enforce tagging standards and prevent deletion of stateful resources.

### Project 5 — Observability Stack on Kubernetes
Deploy a full observability stack on Kubernetes using Helm — Prometheus for metrics collection, Grafana for dashboards with pre-built Node and pod dashboards, Alertmanager for routing alerts to Slack and PagerDuty, Elasticsearch and Fluent Bit for log aggregation, and Kibana for log search and visualization.

---

## Certification Exam Prep

### CKA (Certified Kubernetes Administrator)
The CKA exam is a two-hour, hands-on performance-based exam consisting of approximately 17 tasks in a live Kubernetes environment. It covers cluster architecture, workloads, services, networking, storage, security, and troubleshooting. Mastering imperative `kubectl` commands, memorizing YAML structure for common resources, and practicing time management are the keys to passing.

### AWS DevOps Professional
This certification validates deep expertise in implementing and managing CI/CD pipelines, infrastructure as code, monitoring and logging, policies and standards automation, and incident and event response on AWS. Hands-on experience with CodePipeline, CloudFormation, Systems Manager, and CloudWatch is essential alongside understanding of high-availability architectural patterns.

### Terraform Associate
The HashiCorp Terraform Associate exam tests understanding of Terraform's core workflow, configuration language, state management, module usage, and Terraform Cloud features. It is primarily conceptual and multiple-choice, making the official HashiCorp study guide and hands-on lab exercises the best preparation resources.

---


