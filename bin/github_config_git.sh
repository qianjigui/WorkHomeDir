#!/bin/bash

USERNAME=qianjigui
EMAIL=qianjigui@gmail.com
git config user.name $USERNAME
git config user.email $EMAIL

export GIT_AUTHOR_EMAIL=$EMAIL
export GIT_COMMITTER_NAME=$USERNAME
export GIT_COMMITTER_EMAIL=$EMAIL
