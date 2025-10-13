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
    ├── azurerm_resource_group
    │   └── main.tf
    └── azurerm_virtual_network
        └── main.tf
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

