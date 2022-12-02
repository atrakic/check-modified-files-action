# check-modified-files-action

[![ci](https://github.com/atrakic/check-modified-files-action/actions/workflows/ci.yaml/badge.svg)](https://github.com/atrakic/check-modified-files-action/actions/workflows/ci.yaml)
[![release](https://github.com/atrakic/check-modified-files-action/actions/workflows/release.yaml/badge.svg)](https://github.com/atrakic/check-modified-files-action/actions/workflows/release.yaml)

## Inputs

### `directories`

**Required** The string with listing of directories and files to walk through. Eg. `"src/backend/ commons/ .github/actions/backend.yml Dockefile"`.

## Outputs

### `matched`

True or false if some of files from input directories has been changed.


### Example workflow

```yaml
- name: Check modified files
  id: modified_files
  uses: atrakic/check-modified-files-action@main
  with:
    directories: "foo/setup.sh src/ common/ Dockerfile"

- name: Set up Docker Buildx
  if: steps.modified_files.outputs.matched == 'true'
  uses: docker/setup-buildx-action@v1

- name: Build
  uses: docker/build-push-action@v2
  if: steps.modified_files.outputs.matched == 'true'
  with:
    context: .
    push: true
    tags: foo/bar:latest

```
