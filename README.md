# auc

Add-Update-Cleanup scripts pack

## Usage

### `update.sh`

```sh
curl -fsSL https://raw.githubusercontent.com/dalisoft/auc/master/update.sh | sh
```

### `cleanup.sh`

```sh
curl -fsSL https://raw.githubusercontent.com/dalisoft/auc/master/cleanup.sh | sh
```

## Additional commands

### Remove `node_modules` + `lockfiles`

```sh
find . -iname 'node_modules' -o -iname 'pnpm-lock.yaml' -o -iname 'package-lock.json' -o -iname 'yarn.lock' -o -iname 'bun.lockb' | xargs -L1 rm -rf
```
