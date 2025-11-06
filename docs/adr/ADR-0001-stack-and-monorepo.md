# ADR-0001: Stack and Monorepo Strategy

- **Status:** Accepted
- **Date:** 2025-11-06
- **Owners:** Tech Lead (GPT-5 Codex) & Founder

## Context

We require a scalable foundation that supports multiple frontend apps (customer, rider, admin, vendor) and a suite of backend services. The stack must enable rapid iteration for a small team while providing headroom for hyperlocal logistics complexity.

## Decision

Adopt a TypeScript-first monorepo managed by pnpm and Turborepo, containing React Native and Next.js applications plus Node.js microservices deployed on AWS ECS Fargate. Infrastructure will be provisioned with Terraform.

## Options Considered

1. **Polyrepo with language diversity (Go services, React web, native mobile).**
   - Pros: Service isolation, language specialization per domain.
   - Cons: High cognitive and operational overhead for a small founding team; complex dependency management.

2. **Monorepo with JavaScript/TypeScript stack (Selected).**
   - Pros: Shared language/runtime, reuse of types/packages, simplified tooling, faster onboarding.
   - Cons: Requires disciplined tooling to avoid build contention; may need future extraction for performance-critical services.

3. **Serverless-first architecture (Lambda, Amplify).**
   - Pros: Lower ops burden initially, pay-per-use scaling.
   - Cons: Harder to implement long-running workflows (routing, OMS); cold starts and state management complexity.

## Consequences

- Enables code sharing between apps/services via packages.
- CI/CD complexity reduced through centralized workflows, but requires caching strategy.
- Future scale: we can carve out services into separate repos if needed without rewriting stack.

## Related Documents

- `clothing_quick_commerce_plan.md`
- `README.md`

