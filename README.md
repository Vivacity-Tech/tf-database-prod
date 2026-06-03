# tf-database-prod (Production)

**PRODUCTION INFRASTRUCTURE** - Cloud SQL PostgreSQL for production only.

## ⚠️ CAUTION

This repository manages production database infrastructure. All changes require:
- Code review (minimum 2 approvals)
- Terraform plan review before apply
- Backup verification before any destructive changes
- Testing in staging environment first

## Configuration

**Terraform Cloud Workspace**: `database-prod`

**Environment Variables** (set in TFC):
- `TF_VAR_gcp_project = vivacity-tech-dream`
- `TF_VAR_gcp_region = us-central1`

## Resources

- Production Cloud SQL PostgreSQL instance (REGIONAL HA)
- Application database (appdb)
- 30-day automated backups
- Private IP networking
- Deletion protection enabled

## Outputs

- `database_instance_name` - Cloud SQL instance name
- `database_private_ip` - Private IP address
- `database_connection_name` - Connection name for Cloud SQL Proxy

## Dependencies

- **Depends on**: `vpc-prod`

## Applying Changes

1. Test changes in `tf-database` (non-prod) first
2. Create feature branch
3. Create pull request with detailed description
4. Wait for 2+ approvals
5. Merge to main
6. GitHub Actions runs `terraform plan`
7. Review plan and manually approve apply

## Disaster Recovery

In case of emergency rollback:
```bash
# Get backup ID
gcloud sql backups list --instance=postgres-prod-01

# Restore from backup
gcloud sql backups restore <BACKUP_ID> --backup-instance=postgres-prod-01
```