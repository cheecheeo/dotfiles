#!/usr/bin/env bash

set -euo pipefail

[[ $(date '+%Z') == 'PST' ]] || [[ $(date '+%Z') == 'PDT' ]] || [[ $(date '+%Z') == 'UTC' ]] && echo "$(TZ=America/Los_Angeles date +'%F %R %Z')"" | ""$(date -u +'%F %R %Z')" || echo "$(date +'%F %R %Z')"" | ""$(TZ=America/Los_Angeles date +'%F %R %Z')"" | ""$(date -u +'%F %R %Z')"
