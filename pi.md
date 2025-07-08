 1. CI/CD & DevOps Automation

Q: Describe your approach to designing a scalable CI/CD pipeline for microservices.  
A:
I use a modular approach with reusable templates and pipelines-as-code. Each service has a pipeline template with shared stages—build, test, scan, package, deploy—while allowing team-specific overrides. I use GitHub Actions with reusable workflows, secrets via GitHub OIDC to cloud providers, and ephemeral environments for pull requests using tools like ArgoCD or Terraform for infrastructure provisioning.

⸻

Q: How would you implement progressive delivery?
A:
I combine GitHub Actions for build/deploy steps with deployment strategies via Kubernetes and Argo Rollouts. Canary releases are managed through traffic shaping and metrics (Prometheus + Kiali). I ensure automated rollback using health checks and custom alert thresholds.

⸻

Q: A service deployment is failing intermittently. How do you debug?
A:
I review logs and metrics from the CI/CD platform and correlated Kubernetes/infra logs. I check for flakiness in tests, dependency availability, and changes to base images or environment variables. I add retry logic, increase observability, and ensure reproducibility using locked dependency versions.

⸻

Q: How do you manage secrets securely in GitHub Actions?
A:
I use GitHub OIDC to enable short-lived, scoped cloud credentials without long-lived secrets. For static secrets, I use GitHub’s encrypted secrets or integrate with HashiCorp Vault/AWS Secrets Manager, and avoid passing secrets as plain environment variables.


Q1: How have you used Terraform in a production environment?

Answer:
In my last project, I used Terraform to provision infrastructure on GCP and Azure. I defined reusable modules for VPCs, GKE clusters, IAM policies, and service accounts. I also used Terraform Cloud for state management and implemented workspaces per environment (dev, staging, prod). CI/CD pipelines using GitHub Actions ensured automatic validation, plan, and apply workflows upon PR merges.

⸻

Q2: What are the differences between Terraform and Crossplane, and when would you choose one over the other?

Answer:
Terraform is a declarative IaC tool with a large ecosystem and provider support. It works outside the cluster. Crossplane, on the other hand, is Kubernetes-native and allows you to provision cloud infrastructure as Kubernetes resources. I would use Terraform when the team is not Kubernetes-centric or when managing non-K8s resources at scale. I’d prefer Crossplane for GitOps workflows and when integrating infra provisioning directly into Kubernetes.

Q3: What are some challenges you’ve faced deploying on OpenShift or GKE?

Answer:
On OpenShift, one challenge was handling restricted Security Context Constraints (SCCs), which blocked third-party containers. We had to repackage some services to comply with non-root execution. On GKE, we faced IAM permission issues across projects and used Workload Identity to bind service accounts securely. In both, autoscaling and node pool configuration required fine-tuning for cost-efficiency.

⸻

Q4: How do you manage multi-cloud container deployments across GCP and Azure?

Answer:
I abstracted deployments using Helm charts and ArgoCD for GitOps. Each cloud had environment-specific values and secrets managed by Vault. CI/CD pipelines triggered rollouts and performed canary deployments. For observability, we unified logging with Loki and metrics with Prometheus + Grafana across both platforms.

⸻

⚙️ SECTION 3: AUTOMATION – Ansible, GitHub Actions, Harness CD

Q5: Walk me through an automation pipeline you built using GitHub Actions and Ansible.

Answer:
I created a GitHub Actions pipeline that:
	1.	Validated Terraform plans and Ansible playbooks on PR.
	2.	Used dynamic matrix builds to test against multiple environments.
	3.	Upon merge, it applied Terraform, and then ran Ansible for post-provisioning (installing agents, configuring monitoring).
	4.	Finally, it triggered Slack notifications and updated a status dashboard.

⸻

Q6: What are the benefits of using Harness CD over traditional pipelines?

Answer:
Harness CD offers smart automation with built-in canary deployments, continuous verification (CV), and rollback strategies. Unlike raw GitHub Actions or Jenkins, it gives visibility into each step’s success and health. It reduces the need for custom scripting, especially for blue-green or canary rollout pipelines.
⸻

🤖 2. AI/LLM-Driven Automation

Q: How would you use LLMs to optimize software delivery?
A:
LLMs can automate root cause analysis from logs, generate or validate IaC, suggest changes to GitHub Actions workflows, and build contextual assistants (e.g., ChatOps bots) to help developers self-serve platform tasks or troubleshoot builds.

⸻

Q: What are the risks of using LLMs in production pipelines?
A:
Key risks include hallucination, bias, non-determinism, and security (e.g., prompt injection). I mitigate this by sandboxing outputs, using prompt chaining with strong validation, and ensuring human-in-the-loop for sensitive actions like provisioning or deployment.

⸻

Q: Design an LLM assistant for DevOps.
A:
I would build a Retrieval-Augmented Generation (RAG)-based assistant that indexes runbooks, deployment logs, and metrics dashboards. It integrates with Slack or GitHub via webhooks and can answer queries like “Why did this deployment fail?” or “How do I roll back this service?”

⸻

🧰 3. Ansible & Infra as Code

Q: How do you structure large Ansible projects?
A:
I separate concerns using roles and inventory groups. Each role is reusable, tested independently (via Molecule), and parameterized. I use environment-specific inventory files and Jinja2 templating to keep playbooks DRY and version-controlled.

⸻

Q: Compare Ansible with Terraform.
A:
Ansible is procedural and agentless—great for configuration, provisioning, and post-deployment tasks. Terraform is declarative and best for provisioning cloud resources. In practice, I use Terraform for base infrastructure and Ansible for app-level configuration and orchestration.

⸻

🧱 4. Platform Engineering & Architecture

Q: How do you define the role of a platform team?
A:
To abstract complexity and create paved paths for developers. The platform team builds golden templates, manages shared services (e.g., CI/CD, observability stack), and ensures secure, scalable, and compliant infrastructure that accelerates product teams.

⸻

Q: How do you enable self-service?
A:
By creating developer portals (e.g., Backstage), reusable GitHub Action templates, and CLI tools or bots that allow engineers to provision environments, request secrets, or deploy services without needing to understand the underlying infra.

⸻

Q: How do you abstract Kubernetes complexity?
A:
Via Helm charts, GitOps (ArgoCD), and templated manifests. I also expose a UI or CLI that allows developers to interact with resources in a safe and audited way. In some cases, I’ve wrapped k8s APIs with internal tooling to provide CRUD APIs for services.


Q7: What’s your experience with building AI agent workflows?

Answer:
I built a multi-agent AI platform for automating internal ticket resolution. It used LangChain agents for tool selection, document retrieval, and response generation. I orchestrated tasks using CrewAI and integrated OpenAI’s GPT-4 for LLM reasoning. Each agent had clear responsibilities (e.g., summarization, classification, action), and the whole system communicated asynchronously via a Redis pub/sub layer.

⸻

Q8: How do you manage prompt engineering and memory in agent-based systems?

Answer:
For prompt engineering, I followed modular templates, separating instructions, examples, and dynamic user input. I used LangChain’s memory interfaces (e.g., ConversationBufferMemory) for short-term context and integrated vector databases (e.g., Pinecone) for long-term memory. This allowed agents to retrieve past conversations or documents dynamically, improving relevance and continuity.

⸻

💡 5. Leadership & Vision

Q: How do you align platform capabilities with business outcomes?
A:
By starting with pain points from product teams—like slow deployments, lack of observability, or high cognitive load. I track KPIs like lead time, MTTR, or % of teams on golden paths and tie these back to developer productivity and release velocity.

⸻

Q: How do you mentor senior engineers?
A:
I guide them in architectural decision-making, teach them how to design with scalability/security in mind, and involve them in RFC processes and cross-team discussions. I also review their designs and push them to think in terms of impact and simplicity.

⸻

🔐 6. Security, Compliance & Observability

Q: How do you integrate security into CI/CD?
A:
I implement “shift-left” practices: SAST, DAST, dependency scanning (via Dependabot or Snyk), container scanning, and secret detection during PRs. I also enforce branch protections and use GitHub Advanced Security or similar platforms.

⸻

Q: How do you measure platform health?
A:
I track SLIs like pipeline success rate, deployment latency, MTTR, infra uptime, and developer NPS. I also create scorecards for teams—e.g., “how secure, observable, and resilient is your service?”—to nudge improvements.

⸻

🧪 7. System Design/Whiteboard Exercises

Q: Design a CI/CD platform using GitHub Actions + Docker + Ansible.
A:
	1.	Trigger on push/PR →
	2.	Run tests and lint checks
	3.	Build Docker image, scan with Trivy
	4.	Push to registry
	5.	Use Ansible to pull image and deploy to staging/prod (with tags/branches)
	6.	Post notifications to Slack/MS Teams
	7.	Record metadata for audit
