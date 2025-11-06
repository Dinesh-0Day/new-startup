# ADR-0002: Authentication and Identity Management

- **Status:** Accepted
- **Date:** 2025-11-06
- **Owners:** Tech Lead (GPT-5 Codex) & Founder

## Context

We need a unified authentication layer for customers, riders, internal teams, and boutique partners. Requirements include OTP-based onboarding, social login extensibility, secure API access for mobile apps, and integration with future loyalty/membership features. We also want managed security features (MFA, adaptive risk) without building auth primitives ourselves.

## Decision

Use **Amazon Cognito** as the identity provider:

- User pools for authentication, supporting phone/email OTP and optional social login (Google/Apple) via hosted UI when needed.
- Identity pools for issuing temporary AWS credentials to trusted services (if required for direct S3 access).
- JWT issuance for APIs; services validate tokens using Cognito JWKS.
- Utilize Cognito triggers (Lambda) for custom workflows (e.g., referral rewards on signup, fraud checks).

Customers and riders will authenticate via OTP (SMS using Amazon SNS). Admin/vendor users will have email + password with enforced MFA.

## Options Considered

1. **Build custom auth service.**
   - Pros: Full control and flexibility.
   - Cons: High implementation/maintenance overhead, security risk for small team.

2. **Auth0 / Firebase Authentication.**
   - Pros: Rich feature set, fast to start, social login out-of-the-box.
   - Cons: Higher recurring cost at scale, data residency considerations, vendor lock-in, less aligned with AWS infra.

3. **Amazon Cognito (Selected).**
   - Pros: Native AWS integration, cost-effective at scale, supports OTP flows, integrates with IAM policies, customizable triggers.
   - Cons: UI customization limited (mitigated by building custom login screens), requires careful setup for multi-tenant roles.

## Consequences

- Simplifies auth management with managed security features (password policies, MFA, account recovery).
- Enables cohesive JWT-based authorization for microservices through shared middleware.
- Requires us to build the custom UX for login/signup (preferred) and rely on SNS pricing for OTP.
- Future enhancements: integrate social logins, membership tiers, and device-based risk scoring via Cognito advanced security.

## Related Documents

- ADR-0001 Stack and Monorepo Strategy
- `clothing_quick_commerce_plan.md`
