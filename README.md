\# Azure VM Operations via GitHub Actions (OIDC)



This project demonstrates secure Azure authentication from GitHub Actions using \*\*OpenID Connect (OIDC)\*\* (Workload Identity Federation) — without storing any client secrets.



The workflow performs operational actions (status, start, stop, deallocate, restart) on an Azure Virtual Machine.



---



\## 🚀 Architecture Overview



GitHub Actions → OIDC Token → Microsoft Entra ID → Azure RBAC → Azure VM



No client secrets are stored in GitHub.

Authentication is based on short-lived, cryptographically signed OIDC tokens.



---



\## 🔐 Security Model



This implementation follows modern DevOps security best practices:



\- ✅ Workload Identity Federation (no client secrets)

\- ✅ Least privilege RBAC (Virtual Machine Contributor role)

\- ✅ Short-lived tokens

\- ✅ Repository + branch-based trust (Federated Credential)



---



\## 📦 Target Resources



\- Resource Group: `RG-Lab`

\- Virtual Machine: `server2022`

\- Authentication: OIDC (GitHub → Azure)



---



\## ⚙️ GitHub Secrets Required



The following repository secrets must be configured:



| Secret | Description |

|--------|------------|

| `AZURE\_CLIENT\_ID` | Application (client) ID from Entra ID |

| `AZURE\_TENANT\_ID` | Directory (tenant) ID |

| `AZURE\_SUBSCRIPTION\_ID` | Azure Subscription ID |



No client secret is required.



---



\## 🏗 Azure Configuration



1\. Create an \*\*App Registration\*\* in Microsoft Entra ID.

2\. Add a \*\*Federated Credential\*\* for:

&nbsp;  - Repository: `azure-vm-lab`

&nbsp;  - Branch: `main`

3\. Assign RBAC role on `RG-Lab`:

&nbsp;  - Role: \*\*Virtual Machine Contributor\*\*

&nbsp;  - Assignee: Service Principal of the App Registration



---



\## ▶️ Running the Workflow



Go to:

Actions → \*\*VM Ops via OIDC\*\* → Run workflow



Available actions:



\- `status`

\- `start`

\- `stop`

\- `deallocate`

\- `restart`



---



\## 📄 Workflow Highlights



```yaml

permissions:

&nbsp; id-token: write

&nbsp; contents: read



