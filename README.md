# azure-deploy-scripts

Scripts and templates I use to automate Azure deployments.

## What's in here

- `scripts/deploy-webapp.sh` — Deploy a Python web app to Azure App Service
- `scripts/setup-redis.sh` — Provision Azure Cache for Redis
- `templates/` — ARM templates for common patterns

## Quick start

```bash
# Login to Azure CLI
az login

# Deploy web app
./scripts/deploy-webapp.sh --name my-app --rg my-resource-group
```

## Notes

These are personal scripts, not production-grade. Use at your own risk.

## License

MIT


## Getting Started

See individual files for usage details.
