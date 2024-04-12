# auc

Add-Update-Cleanup scripts pack

## Usage

### `update.sh`

```sh
curl https://gist.github.com/dalisoft/8f2ce3b8783158b4436c847e71a395c6/raw/f7a59bad064214ffa8185c6f5e4ce8b749772aad/cleanup.sh | sh
curl -fsSLO https://raw.githubusercontent.com/dalisoft/lint-staged-sh/master/lint-staged.sh
```

### `cleanup.sh`

```sh
curl https://gist.github.com/dalisoft/8f2ce3b8783158b4436c847e71a395c6/raw/f7a59bad064214ffa8185c6f5e4ce8b749772aad/cleanup.sh | sh
```

## Additional commands

### Remove `node_modules` + `lockfiles`

```sh
find . -iname 'node_modules' -o -iname 'pnpm-lock.yaml' -o -iname 'package-lock.json' -o -iname 'yarn.lock' -o -iname 'bun.lockb' | xargs -L1 rm -rf
```
