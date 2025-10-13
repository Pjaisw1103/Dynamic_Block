<h1 align="center">🌐 Terraform Azure Infrastructure Automation</h1>

<p align="center">
This project automates the creation of Azure resources using <b>Terraform</b>.<br>
It provisions a <b>Resource Group</b>, a <b>Virtual Network</b>, and <b>five Subnets</b> — making environment setup consistent and repeatable.
</p>

<hr>

<h2>📁 Project Structure</h2>

<pre>
.
├── Environment
│   ├── dev
│   │   └── provider.tf
│   └── prod
│       └── provider.tf
│
├── Module
│   ├── azurerm_resource_group
│   │   └── main.tf
│   └── azurerm_virtual_network
│       └── main.tf
│
├── main.tf
├── terraform.tfvars
└── variable.tf
</pre>

<hr>

<h2>🏗️ Resources Created</h2>

<table>
  <tr>
    <th>Resource Type</th>
    <th>Resource Name</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>Resource Group</td>
    <td><b>demo-rg</b></td>
    <td>Main container for all Azure resources</td>
  </tr>
  <tr>
    <td>Virtual Network</td>
    <td><b>demo-vnet</b></td>
    <td>Virtual network spanning all subnets</td>
  </tr>
  <tr>
    <td>Subnet 1</td>
    <td>subnet-1</td>
    <td>Address Prefix: <code>10.0.1.0/24</code></td>
  </tr>
  <tr>
    <td>Subnet 2</td>
    <td>subnet-2</td>
    <td>Address Prefix: <code>10.0.2.0/24</code></td>
  </tr>
  <tr>
    <td>Subnet 3</td>
    <td>subnet-3</td>
    <td>Address Prefix: <code>10.0.3.0/24</code></td>
  </tr>
  <tr>
    <td>Subnet 4</td>
    <td>subnet-4</td>
    <td>Address Prefix: <code>10.0.4.0/24</code></td>
  </tr>
  <tr>
    <td>Subnet 5</td>
    <td>subnet-5</td>
    <td>Address Prefix: <code>10.0.5.0/24</code></td>
  </tr>
</table>

<hr>

<h2>🖼️ Infrastructure Diagram</h2>

```mermaid
graph TD
    A[demo-rg] --> B[demo-vnet]
    B --> C[subnet-1 (10.0.1.0/24)]
    B --> D[subnet-2 (10.0.2.0/24)]
    B --> E[subnet-3 (10.0.3.0/24)]
    B --> F[subnet-4 (10.0.4.0/24)]
    B --> G[subnet-5 (10.0.5.0/24)]
<p><i>(This diagram automatically renders on GitHub — showing RG → VNet → Subnets)</i></p> <hr> <h2>⚙️ How to Use</h2> <ol> <li><b>Initialize Terraform</b></li> <pre><code>terraform init</code></pre> <li><b>Validate Configuration</b></li> <pre><code>terraform validate</code></pre> <li><b>Plan Infrastructure</b></li> <pre><code>terraform plan</code></pre> <li><b>Apply Configuration</b></li> <pre><code>terraform apply -auto-approve</code></pre> <li><b>Destroy Resources (if needed)</b></li> <pre><code>terraform destroy</code></pre> </ol> <hr> <h2>📘 Notes</h2> <ul> <li>All environment-specific provider configurations are stored inside <code>Environment/</code> (e.g., <code>dev</code>, <code>prod</code>).</li> <li>Modularized structure under <code>Module/</code> ensures reusability and clean organization.</li> <li>Update <code>terraform.tfvars</code> to modify resource names, locations, or address prefixes.</li> <li>The project follows a consistent naming convention for better manageability.</li> </ul> <hr> <h3 align="center">🚀 Built with ❤️ using Terraform on Azure</h3> ```