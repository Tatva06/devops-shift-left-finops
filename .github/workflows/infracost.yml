name: Shift-Left FinOps (Infracost)

on:
  pull_request:
    types: [opened, synchronize, closed]

jobs:
  infracost_cost_estimation:
    name: Run Cost Analysis
    runs-on: ubuntu-latest
    permissions:
      contents: read
      pull-requests: write

    steps:
      - name: Checkout PR branch
        uses: actions/checkout@v4
        if: github.event.action != 'closed'
        with:
          path: head

      - name: Checkout base branch
        uses: actions/checkout@v4
        if: github.event.action != 'closed'
        with:
          ref: ${{ github.event.pull_request.base.ref }}
          path: base

      - name: Generate Infracost Report
        uses: infracost/actions/diff@v4
        with:
          api-key: ${{ secrets.INFRACOST_API_KEY }}
          base-path: base
          head-path: head
