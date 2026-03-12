#!/bin/bash

flightctl get devices -o json | jq -r '.items[]
    | select(.status.conditions[]? | .type == "MultipleOwners" and .status == "True")
    | "Device: \(.metadata.name)\nLabels: \(.metadata.labels // "None")\n---"'
