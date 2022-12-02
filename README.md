# check-modified-files-action

[![ci](https://github.com/atrakic/check-modified-files-action/actions/workflows/ci.yml/badge.svg)](https://github.com/atrakic/check-modified-files-action/actions/workflows/ci.yml)

## Inputs

### `directories`

**Required** The string with directories and files to check. Eg. `"src/backend/ commons/ .github/actions/backend.yml Dockefile"`.

## Outputs

### `matched`

True or false if some of files from input directories has been changed.


### Example workflow

```yaml
- name: Check out code
  uses: actions/checkout@v3
  with:
    fetch-depth: 2

- name: Check modified files
  id: modified_files
  uses: atrakic/check-modified-files-action@main
  with:
    directories: "src/backend/ common/ Dockerfile.backend"

- name: Set up Docker Buildx
  if: steps.modified_files.outputs.matched == 'true'
  uses: docker/setup-buildx-action@v2

- name: Build
  uses: docker/build-push-action@v3
  if: steps.modified_files.outputs.matched == 'true'
  with:
    context: .
    push: true
    tags: foo/bar:latest
```
