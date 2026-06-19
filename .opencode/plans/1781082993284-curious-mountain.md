# Create Branch `10-min`

## Overview
Create a new git branch named `10-min` from the current state of `main`.

## Current State
- On branch `main` (commit `4fc6e98`)
- There are **uncommitted changes** in `code-config-curriculum.md`

## Plan
1. Create and switch to branch `10-min`:
   ```bash
   git checkout -b 10-min
   ```
   This creates the branch from `HEAD` including the unstaged changes, so they carry over.

## Verification
- Run `git branch --list` to confirm `10-min` exists and is checked out.
- Run `git status` to verify the uncommitted changes are still present.
