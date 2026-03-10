# Local Rime Workflow

This repo is the source-of-truth for your Rime configuration.

## Layout

- Repo source: `/Users/admin/Projects/Workflows/rime-config`
- Runtime dir: `/Users/admin/Library/Rime`

Do not edit `build/`, `*.userdb/`, `user.yaml`, or `installation.yaml` in the runtime dir and expect those changes to be durable.

## Update flow

1. Edit YAML files in this repo.
2. Run:

```bash
/Users/admin/Projects/Workflows/rime-config/scripts/sync-to-rime.sh
```

3. Squirrel will rebuild and reload automatically.

## Git remotes

- `upstream`: `https://github.com/iDvel/rime-ice.git`
- `origin`: add this after `gh auth login` and creating your own fork/repo

Example after GitHub login:

```bash
cd /Users/admin/Projects/Workflows/rime-config
gh repo create rime-config --private --source=. --remote=origin --push
```
