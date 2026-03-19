# AWS to Krutrim Cloud Service Migration

## Overview
Migrated Ola Financial Services from AWS to OLA inhouse cloud platform, Krutrim Cloud.
This was done by provisioning VMs, configuring load balancers, and updating DNS records with zero downtime.

## Architecture
Source : AWS
Target : KCS
DNS migrated using Akamai

## Steps
- Analyzed the existing AWS infrastructure
- Provisioned the same infrastructure in KCS by creating similar VMs
- Configured load balancers
- Migrated DNS from Route53 to Akamai
- Performed validation and testing
- Ensured zero downtime migration

## Zero Downtime Migration
Zero downtime was achieved by controlling traffic switching instead of shutting down systems.
- Built the new infrastructure in parallel on Krutrim Cloud while AWS continued serving live traffic
- Deployed the same application stack and configurations on the new environment
- Performed internal testing using private endpoints to validate application behavior, APIs, and database connectivity
- Reduced DNS TTL to 30–60 seconds to ensure fast propagation
- Updated DNS records (Route53 to Akamai to LB)
- Traffic was gradually redirected to the new infrastructure
- AWS infrastructure was kept active during and after migration

## Tools Used
- AWS
- KCS
- Akamai
- Postman
- Grafana
- Python/Ansible  scripts

## Issues Faced
- JFrog Artifactory got corrupted during the start of migration phase
- Configuration mismatches
- Version mismatches