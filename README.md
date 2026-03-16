# CIA — Hybrid Infrastructure with Proxmox

**Group:** PAR_18

## Stack

| Tool | Role |
|---|---|
| Proxmox VE | Virtualization — 2 sites, 4 VMs max each |
| pfSense | Firewall · Router · VPN · DNS |
| OpenVPN | Site-to-site encrypted tunnel |
| NetBox | IPAM — IP address management |
| Elasticsearch + Kibana | Log centralization |
| Zabbix | Metrics & alerting |

## Architecture

```
Site A (on-prem)                    Site B (cloud)
├── VM1 : pfSense                   ├── VM1 : pfSense
├── VM2 : NetBox                    ├── VM2 : Bastion (SSH jump)
├── VM3 : Elasticsearch + Kibana    ├── VM3 : SRV-LINUX (web interne)
└── VM4 : Zabbix                    └── VM4 : SRV-DNS
         └──────── VPN OpenVPN ────────┘
```

## Repository Structure

```
.
├── bastion/
├── docs/
├── elastic/
├── netbox/
├── pfsense/
├── proxmox/
├── vpn/
├── web/
└── README.md
```

## Project Tracking

| Jira Board | [https://projet700.atlassian.net/jira/software/projects/PC/boards/34?jql=assignee+IN+%28712020%3Ae3e10981-8f71-45b9-ade6-493cb95b8b94%2C+619656c0977c5b0072656651%2C+empty%29&atlOrigin=eyJpIjoiNTE3MDQ5YTI0Mjc3NGZkZjlhMGZhYjQ1YmVhMDY5YmYiLCJwIjoiaiJ9] |

## Status

| Component | Status |
|---|---|
| Proxmox Site A | 🟡 In progress |
| Proxmox Site B | 🟡 In progress |
| pfSense x2 | 🟡 In progress |
| VPN Site-to-Site | ⬜ Not started |
| NetBox | ⬜ Not started |
| Elasticsearch | ⬜ Not started |
| Zabbix | ⬜ Not started |
| Bastion | ⬜ Not started |
| IaC (Terraform + Ansible) | ⬜ Not started |
| Documentation | 🟡 In progress |

## Team — PAR_18

| Member | GitHub |
|---|---|
| Faithgot Glindayi | @Faithgg |
| Bruno junior Mawete | @juunior.mwt |
| Nisrine Adamo | @niss-tech |
| Floriane Banzouzi-keta | @flo |
| Salim El Djouzi | @ElSalim75 |


## Blockers

_None at this stage._
