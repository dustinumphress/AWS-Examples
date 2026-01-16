## Purpose

This repository is a collection of small, self-contained AWS example projects (CloudFormation, CDK, SDK samples, Docker, Ruby/Java/TypeScript snippets). The goal of these instructions is to help AI coding agents become productive quickly by pointing out repository-wide conventions, common workflows, and where to find authoritative per-example commands.

## Big picture

- **Organization:** examples are grouped by AWS service under top-level folders (e.g., `s3/`, `ec2/`, `lambda/`). Each service folder contains one or more example subfolders that are intended to be standalone.
- **IaC patterns:** you will find multiple IaC styles coexisting: CloudFormation YAML templates (e.g., [s3/iac/cfn/template.yaml](s3/iac/cfn/template.yaml#L1)), CDK TypeScript apps (see [s3/iac/cdk/README.md](s3/iac/cdk/README.md#L1)), and occasionally provider-specific tooling scripts.
- **Language variety:** examples use multiple languages and runtimes (TypeScript/CDK, Java, Ruby, shell scripts and Dockerfiles). Expect per-folder tooling (e.g., `npm` for CDK TypeScript projects, `Gemfile` for Ruby examples).

## Developer workflows (what actually works here)

- For CDK TypeScript examples (like `s3/iac/cdk`): run the commands in the folder `README.md` — typical commands are `npm run build`, `npm run test`, and `cdk deploy` (see [s3/iac/cdk/README.md](s3/iac/cdk/README.md#L1)).
- For CloudFormation examples: templates live under `*/iac/cfn/` (for example [s3/iac/cfn/template.yaml](s3/iac/cfn/template.yaml#L1)). Deploy using AWS CLI or the Console. A typical CLI pattern is:

  - `aws cloudformation deploy --template-file path/to/template.yaml --stack-name MyStack --capabilities CAPABILITY_NAMED_IAM`

- For language-specific examples check the local `README.md` in the example folder first — these files contain the canonical build / run / deploy steps for that example (many examples include a folder-level README; see top-level [README.md](README.md#L1)).
- The repository includes an AWS CLI installer under `aws/install` and a supporting `aws/README.md` explaining installation and usage — use that if CI or local environment lacks `aws`.

## Project-specific conventions and patterns

- Folder-local READMEs are authoritative: before changing or executing an example, open its `README.md` (almost every example folder contains one).
- Minimalism: many examples intentionally show the smallest working snippet for a service. Do not assume production-ready security defaults — preserve the example's intent when editing.
- Keep examples self-contained: avoid adding global repo-level dependencies unless you also update the example's `README.md` with precise install/run steps.

## Integration points & external dependencies

- Examples rely on the AWS CLI or AWS SDKs for their runtime interactions. Confirm presence of `aws` (see `aws/install`).
- CDK examples require `npm` and the AWS CDK toolkit. Use the example's `package.json`/`cdk.json` to determine required versions.

## What to look for when editing or creating examples

- Always update the example `README.md` with exact commands you used to validate changes.
- Add minimal tests where examples already have tests (e.g., CDK TypeScript uses `jest` per `s3/iac/cdk/README.md`).
- Preserve file names and top-level structure within an example (many automation flows expect `template.yaml`, `cdk.json`, `Dockerfile`, etc.).

## Quick pointers for agents

- Start by opening the example folder and its `README.md` — that is the single best source of truth for build/deploy commands.
- When proposing code changes, reference the example path and the lines you changed (use repository-relative links).
- If you add a new example, include a `README.md` with: prerequisites, 3–5 explicit commands for build/test/deploy, and the minimal expected output.

---
If anything here is unclear or you want examples tailored to a particular service folder (for example `s3/` or `lambda/`), tell me which folders and I will update this file with more targeted guidance.
