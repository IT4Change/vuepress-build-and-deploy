FROM node:20.12.1-slim as base

LABEL "com.github.actions.name"="Vuepress Build & Deploy"
LABEL "com.github.actions.description"="A GitHub Action to build and deploy Vuepress sites to GitHub Pages"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="gray-dark"

LABEL "repository"="https://github.com/IT4Change/vuepress-build-and-deploy.git"
LABEL "homepage"="https://github.com/jenkey2011/vuepress-deploy"
LABEL "maintainer"="mahula <mathias.lenz@it4c.dev>"

RUN apt-get update && apt-get install -y git jq

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
