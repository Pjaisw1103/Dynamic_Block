<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Terraform Azure Infrastructure Automation</title>

  <!-- Mermaid (for diagram) - requires internet to load the CDN -->
  <script src="https://unpkg.com/mermaid@9.5.0/dist/mermaid.min.js"></script>
  <script>
    mermaid.initialize({ startOnLoad: true });
  </script>

  <style>
    :root{
      --bg:#0f1724;
      --card:#0b1220;
      --accent:#0ea5a4;
      --muted:#94a3b8;
      --white:#f8fafc;
      --glass: rgba(255,255,255,0.03);
      --radius:14px;
      font-family: Inter, ui-sans-serif, system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial;
    }

    body{
      margin:0;
      background:linear-gradient(180deg,#031025 0%, #071627 100%);
      color:var(--white);
      -webkit-font-smoothing:antialiased;
      -moz-osx-font-smoothing:grayscale;
      line-height:1.45;
      padding:40px;
      display:flex;
      justify-content:center;
    }

    .container{
      width:100%;
      max-width:980px;
      background: linear-gradient(180deg, rgba(255,255,255,0.02), rgba(255,255,255,0.01));
      border-radius:18px;
      box-shadow: 0 8px 30px rgba(2,6,23,0.6);
      padding:28px;
      border:1px solid rgba(255,255,255,0.03);
    }

    header{text-align:center; margin-bottom:18px}
    h1{font-size:28px; margin:8px 0; display:flex; align-items:center; justify-content:center; gap:10px}
    .subtitle{color:var(--muted); margin-top:6px}

    .grid{
      display:grid;
      grid-template-columns: 1fr;
      gap:18px;
      margin-top:18px;
    }

    .card{
      background:var(--glass);
      border-radius:12px;
      padding:16px;
      border:1px solid rgba(255,255,255,0.03);
      overflow:auto;
    }

    pre, code{
      font-family: SFMono-Regular, Menlo, Monaco, "Roboto Mono", "Courier New", monospace;
      font-size:13px;
      background: rgba(0,0,0,0.14);
      padding:8px;
      border-radius:8px;
      display:block;
      color:var(--white);
    }

    .project-structure pre{white-space:pre-wrap;}
    table{
      width:100%;
      border-collapse:collapse;
      margin-top:8px;
      font-size:14px;
    }
    thead th{
      text-align:left;
      padding:10px 12px;
      color:var(--accent);
      font-weight:600;
      background: linear-gradient(90deg, rgba(255,255,255,0.01), rgba(255,255,255,0.00));
      border-bottom:1px solid rgba(255,255,255,0.03);
    }
    tbody td{
      padding:10px 12px;
      border-bottom:1px solid rgba(255,255,255,0.03);
      color: #e6eef5;
    }

    .diagram{
      padding:12px;
      background: linear-gradient(180deg, rgba(255,255,255,0.01), rgba(255,255,255,0.00));
      border-radius:10px;
    }

    .commands{
      display:flex;
      gap:12px;
      flex-wrap:wrap;
      margin-top:8px;
    }
    .cmd{
      background: rgba(255,255,255,0.02);
      border-radius:10px;
      padding:10px 12px;
      font-family: monospace;
      border:1px solid rgba(255,255,255,0.02);
      box-shadow: inset 0 -8px 24px rgba(0,0,0,0.2);
    }

    .footer{
      text-align:center;
      color:var(--muted);
      margin-top:16px;
      font-size:13px;
    }

    /* Responsive */
    @media (min-width:880px){
      .grid{ grid-template-columns: 1fr 420px; align-items:start; }
      .project-structure{ grid-column: 1 / 2; }
    }

  </style>
</head>
<body>
  <div class="container">
    <header>
      <h1>🌐 Terraform Azure Infrastructure Automation</h1>
      <div class="subtitle">Automates creation of Resource Group, Virtual Network (demo-vnet) and 5 subnets in Azure using Terraform.</div>
    </header>

    <div class="grid">
      <!-- Left column -->
      <div>
        <section class="card project-structure" aria-labelledby="structure-title">
          <h2 id="structure-title">📁 Project Structure</h2>
          <pre>
.
├── Environment
│   ├── dev
│   │   └── provider.tf
│   └── prod
│       └── provider.tf
├── Module
│   ├── azurerm_resource_group
│   │   └── main.tf
│   └── azurerm_virtual_network
│       └── main.tf
├── main.tf
├── terraform.tfvars
└── variable.tf
          </pre>
        </section>

        <section class="card" aria-labelledby="resources-title" style="margin-top:14px">
          <h2 id="resources-title">🏗️ Resources Created</h2>

          <table>
            <thead>
              <tr>
                <th>Resource Type</th>
                <th>Resource Name</th>
                <th>Description</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>Resource Group</td>
                <td><strong>demo-rg</strong></td>
                <td>Main container for all Azure resources</td>
              </tr>
              <tr>
                <td>Virtual Network</td>
                <td><strong>demo-vnet</strong></td>
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
            </tbody>
          </table>
        </section>

        <section class="card" aria-labelledby="notes-title" style="margin-top:14px">
          <h2 id="notes-title">📘 Notes</h2>
          <ul>
            <li>Environment-specific provider configs live in <code>Environment/</code> (dev, prod).</li>
            <li>Modules under <code>Module/</code> increase reusability and clarity.</li>
            <li>Update <code>terraform.tfvars</code> to change names, location or address prefixes.</li>
          </ul>
        </section>
      </div>

      <!-- Right column -->
      <div>
        <section class="card diagram" aria-labelledby="diagram-title">
          <h2 id="diagram-title">🖼️ Infrastructure Diagram</h2>
          <!-- Mermaid diagram -->
          <div class="mermaid">
graph TD
    A[demo-rg] --> B[demo-vnet]
    B --> C[subnet-1<br/>(10.0.1.0/24)]
    B --> D[subnet-2<br/>(10.0.2.0/24)]
    B --> E[subnet-3<br/>(10.0.3.0/24)]
    B --> F[subnet-4<br/>(10.0.4.0/24)]
    B --> G[subnet-5<br/>(10.0.5.0/24)]
          </div>
        </section>

        <section class="card" aria-labelledby="usage-title" style="margin-top:14px">
          <h2 id="usage-title">⚙️ How to Use</h2>

          <div class="commands" aria-hidden="false">
            <div>
              <div class="cmd">terraform init</div>
              <div style="color:var(--muted); margin-top:6px; font-size:13px">Initialize backend & providers</div>
            </div>

            <div>
              <div class="cmd">terraform validate</div>
              <div style="color:var(--muted); margin-top:6px; font-size:13px">Validate config</div>
            </div>

            <div>
              <div class="cmd">terraform plan</div>
              <div style="color:var(--muted); margin-top:6px; font-size:13px">See execution plan</div>
            </div>

            <div>
              <div class="cmd">terraform apply -auto-approve</div>
              <div style="color:var(--muted); margin-top:6px; font-size:13px">Apply changes</div>
            </div>

            <div>
              <div class="cmd">terraform destroy</div>
              <div style="color:var(--muted); margin-top:6px; font-size:13px">Remove resources</div>
            </div>
          </div>
        </section>

        <section class="card" aria-labelledby="extra-title" style="margin-top:14px">
          <h2 id="extra-title">Tips & Best Practices</h2>
          <ul>
            <li>Keep state secure (use remote state like Azure Storage with state locking).</li>
            <li>Use variables and <code>terraform.tfvars</code> for environment differences.</li>
            <li>Modularize further (subnets as a loop/dynamic block inside the vnet module).</li>
          </ul>
        </section>
      </div>
    </div>

    <div class="footer">
      <p>🚀 Built with ❤️ using Terraform on Azure — Resource Group: <strong>demo-rg</strong> • VNet: <strong>demo-vnet</strong></p>
    </div>
  </div>
</body>
</html>
