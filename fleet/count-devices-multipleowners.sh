#!/bin/bash

flightctl get devices -o json | jq '[.items[]
    | .status.conditions[]?
    | select(.type == "MultipleOwners" and .status == "True")]
    | length'
