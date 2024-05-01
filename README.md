# Vuepress-build-and-deploy
A GitHub Action to build and deploy Vuepress sites to GitHub Pages

This repository has been forked from @jenkey2011's [Vuepress deploy Github Action](https://github.com/jenkey2011/vuepress-deploy) to keep the code current and useful.
At the moment this is work in progress and not published at the [Github Marketplace](https://github.com/marketplace/) yet.    

To further use @jenkey2011's [Vuepress deploy Github Action](https://github.com/marketplace/actions/vuepress-deploy) please refer to its current [README](https://github.com/jenkey2011/vuepress-deploy#).

## Usage
Create `vuepress-deploy.yml` in the `.github/workflows` directory in the root of your repository.

```yml
name: Build and Deploy
on: [push]
jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout
      uses: actions/checkout@master

    - name: vuepress-deploy
      uses: IT4Change/vuepress-build-and-deploy@master
      env:
        ACCESS_TOKEN: ${{ secrets.ACCESS_TOKEN }}
        TARGET_REPO: username/repo
        TARGET_BRANCH: master
        BUILD_SCRIPT: yarn && yarn build
        BUILD_DIR: blog/.vuepress/dist/
```

The action will auto deploy the vuepress project when you push your code. Enjoy!

## Parameters

|  Parameter |  Description | Type | Required
| :------------ | :------------ |:------------ |:------------ |
| `ACCESS_TOKEN` | Personal access token | `secrets`  |  **Yes** |
| `TARGET_REPO` | The repository you want to deploy. e.g.:`IT4Change/boilerplate-backend`. Default: **current repository** | `env` | **No** |
| `TARGET_BRANCH` | The branch you want to deploy. e.g.:`gh-pages`.Default: **gh-pages** | `env` | **No** |
| `TARGET_LINK` | The full address of the target repo will cover `TARGET_REPO` for other platforms. e.g.:`https://user:${{ secrets.CODING_TOKEN }}@team.coding.net/team/repo.git`. | `env` | **No** |
| `BUILD_SCRIPT` | The script to build the vuepress project. e.g.: `yarn && yarn build` | `env` | **Yes** |
| `BUILD_DIR` | The output of the build-script above. e.g.: `blog/.vuepress/dist/` | `env` | **Yes** |
| `COMMIT_MESSAGE` | The commit message supplied when pushing new changes e.g.: `Auto deploy from Github Actions` | `env` | **No** |
| `CNAME` | Alias Record of your site. | `env` | **No** |


## Step-by-Step Guide

### Create a personal access token

click your profile icon > Settings > Developer settings > Personal access tokens > Generate new token (Classic) > At least check `repo`. Then you will get a token, copy it.

### Creating encrypted secrets

Under your repository name, click  Settings > Secrets > Type `ACCESS_TOKEN` in the "Name" input box && the the personal access token as value.

### Create a workflow file
If you repo doesn't already have one, create a workflow file. You must store workflows in the `.github/workflows` directory in the root of your repository.

In `.github/workflows`, add a `.yml` or `.yaml` file for your workflow. For example, `.github/workflows/vuepress-deploy.yml`.

**For more information**:

1. [Triggering new workflows using a personal access token](https://docs.github.com/en/actions/reference/events-that-trigger-workflows#triggering-new-workflows-using-a-personal-access-token)
2. [Encrypted secrets](https://docs.github.com/en/actions/reference/encrypted-secrets)
3. [Learn GitHub Actions](https://docs.github.com/en/actions/learn-github-actions)
