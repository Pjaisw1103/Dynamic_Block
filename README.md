<h1 align="center">🌐 Terraform Azure Infrastructure Automation</h1>

<p align="center">
This project automates the creation of Azure resources using <b>Terraform</b>.<br>
It provisions a <b>Resource Group</b>, a <b>Virtual Network</b>, and <b>five Subnets</b> — making environment setup consistent and repeatable.
</p>

<hr>

<h2>⚙️ Dynamic Block in Terraform</h2>

<p>
  The <b>dynamic block</b> in Terraform allows you to create multiple nested configuration blocks based on variable input — removing repetitive code and making configurations more scalable.<br>
  In this project, the <b>dynamic block</b> is used to create <b>multiple subnets</b> inside a single <b>Virtual Network</b> dynamically.
</p>

<h3>🧩 Example Use Case</h3>

<p>
  Here we are creating:
</p>
<ul>
  <li>1 Resource Group</li>
  <li>1 Virtual Network</li>
  <li>5 Subnets (using a Dynamic Block)</li>
</ul>


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

<h3>📘 Terraform Code Example</h3>

<pre><code class="language-hcl">
# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "demo-rg"
  location = "WestEurope"
}

# Virtual Network with Dynamic Subnets
resource "azurerm_virtual_network" "vnet" {
  name                = "demo-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = "WestEurope"
  resource_group_name = "demo-rg"

  dynamic "subnet" {
    for_each = var.subnets
    content {
      name           = subnet.value.name
      address_prefix = subnet.value.address_prefix
    }
  }
}
</code></pre>

<h3>📦 Variable Example</h3>

<pre><code class="language-hcl">
variable "subnets" {

}
  
subnets =  {
  subnet1 =  {
        subnet-name = "subnet-1"
        address-prefixes = ["10.0.1.0/24"]
  }
  subnet2 =  {
        subnet-name = "subnet-2"
        address-prefixes = ["10.0.2.0/24"]
  }
  subnet3 =  {
        subnet-name = "subnet-3"
        address-prefixes = ["10.0.3.0/24"]
  }
  subnet4 =  {
        subnet-name = "subnet-4"
        address-prefixes = ["10.0.4.0/24"]
  }
  subnet5 =  {
        subnet-name = "subnet-5"
        address-prefixes = ["10.0.5.0/24"]
  }
}

</code></pre>

<h3>🖥️ Terraform Output Example</h3>

<pre><code>
# terraform apply

azurerm_resource_group.rg: Creating...
azurerm_resource_group.rg: Creation complete after 2s [id=/subscriptions/.../demo-rg]

azurerm_virtual_network.vnet: Creating...
azurerm_virtual_network.vnet: Creation complete after 5s [id=/subscriptions/.../demo-vnet]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

Outputs:

rg_name   = "demo-rg"
vnet_name = "demo-vnet"
subnets   = [
  "subnet-1",
  "subnet-2",
  "subnet-3",
  "subnet-4",
  "subnet-5"
]
</code></pre>

<h3>🧠 Key Takeaways</h3>

<ul>
  <li><b>Dynamic Blocks</b> eliminate repetitive subnet declarations.</li>
  <li>Useful when subnet count or configuration might change frequently.</li>
  <li>Each subnet is generated automatically based on the <code>subnets</code> variable list.</li>
  <li>Enhances scalability and keeps Terraform code DRY (Don’t Repeat Yourself).</li>
</ul>

<hr>

<h2>🤝 Contribution</h2>

<p>
  Contributions are always welcome!<br>
  If you’d like to improve or extend this project, please fork the repository and submit a pull request.
</p>

<hr>

<p align="center">
  Made with ❤️ using <b>Terraform</b> and <b>Microsoft Azure</b>.<br>
  <i>Automate • Deploy • Scale</i>
</p>
