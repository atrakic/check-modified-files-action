# check-modified-files-action

## Inputs

### `who-to-greet`

**Required** The name of the person to greet. Default `"World"`.

## Outputs

### `time`

The time we greeted you.


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
