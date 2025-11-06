# QuickStyle – Hyperlocal Apparel Quick Commerce

This monorepo powers a pan-India on-demand clothing platform delivering curated outfits within 90 minutes.

## Structure

- `apps/`
  - `customer-app/` – React Native customer experience (Expo managed workflow)
  - `rider-app/` – React Native rider operations companion
  - `admin-portal/` – Next.js internal tooling for merchandising, OMS, CX teams
  - `vendor-portal/` – Next.js partner portal for boutiques and brands
- `services/`
  - `catalog-service/`
  - `inventory-service/`
  - `order-service/`
  - `logistics-service/`
  - `user-service/`
  - `notification-service/`
- `packages/`
  - `ui-kit/` – shared design system across apps
  - `utils/` – cross-cutting TypeScript utilities
  - `config/` – linting, TypeScript, commit hooks configuration
  - `telemetry/` – OpenTelemetry + observability instrumentation helpers
- `infra/`
  - `terraform/` – environment IaC (sandbox, staging, prod) and reusable modules
  - `github-actions/` – reusable CI/CD workflow definitions
- `docs/`
  - `adr/` – architecture decision records
  - `api-contracts/` – GraphQL/OpenAPI schemas and interface contracts
  - `runbooks/` – operational procedures and incident SOPs
- `scripts/` – local development automation

## Getting Started (Sprint 0)

1. Configure AWS credentials with least-privilege IAM role for Terraform.
2. Populate Terraform backend configuration (`infra/terraform/backends` planned) and bootstrap sandbox environment.
3. Initialize pnpm workspaces and Turborepo for apps/services/packages.
4. Scaffold base services (`catalog-service`, `order-service`, etc.) with Fastify, Prisma, and shared config packages.
5. Connect CI (GitHub Actions) enforcing lint/test, Terraform plan, and preview deployments.

Refer to `clothing_quick_commerce_plan.md` for the strategic blueprint and Sprint plans.

