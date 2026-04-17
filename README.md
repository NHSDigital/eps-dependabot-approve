# Electronic Prescriptions Service dependabot approve

Composite GitHub Action to automatically approve and enable auto-merge for trusted dependency update pull requests.
This will be called from each repo on a scheduled basis

## What this action does

This action:

1. Lists open pull requests in the current repository.
2. Filters pull requests to only include those where:
   - the head commit signature is verified, and
   - the commit author is either `dependabot[bot]` or `eps-create-pull-request[bot]`.
3. Approves each eligible pull request.
4. Enables auto-merge using squash merge for each eligible pull request.

## Inputs

| Name | Required | Description |
| --- | --- | --- |
| `AUTOMERGE_APP_ID` | Yes | GitHub App ID used to authenticate and approve pull requests. |
| `AUTOMERGE_PEM` | Yes | Private key for the GitHub App in PEM format. |

## Usage

```yaml
name: Auto-approve dependency updates

on:
  workflow_dispatch:
  schedule:
    - cron: '*/30 * * * *'

permissions: {}

jobs:
  auto-approve-dependabot:
    runs-on: ubuntu-22.04
    environment: create_pull_request
    permissions:
      contents: write
      pull-requests: write
    steps:
      - name: Auto approve and enable auto-merge
        uses: NHSDigital/eps-dependabot-approve@db39aa18bf6b1ce317219661299a91c572689bb7
        with:
          AUTOMERGE_APP_ID: ${{ secrets.AUTOMERGE_APP_ID }}
          AUTOMERGE_PEM: ${{ secrets.AUTOMERGE_PEM }}
```

## Notes

- Pull requests that do not meet the verification and bot-author checks are skipped.
- If no pull requests are eligible, the action completes without approving or merging anything.


## Contributing

Contributions to this project are welcome from anyone, providing that they conform to the [guidelines for contribution](./CONTRIBUTING.md) and the [community code of conduct](./CODE_OF_CONDUCT.md).

### Licensing

This code is dual licensed under the MIT license and the OGL (Open Government License). Any new work added to this repository must conform to the conditions of these licenses. In particular this means that this project may not depend on GPL-licensed or AGPL-licensed libraries, as these would violate the terms of those libraries' licenses.

The contents of this repository are protected by Crown Copyright (C).
