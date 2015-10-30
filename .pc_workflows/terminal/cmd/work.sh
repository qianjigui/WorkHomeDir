workgitconfig() {
    GIT_USERNAME=pengcheng.wang
    GIT_EMAIL=pengcheng.wang@alibaba-inc.com
    git config user.name $GIT_USERNAME
    git config user.email $GIT_EMAIL

    export GIT_AUTHOR_NAME=$GIT_USERNAME
    export GIT_AUTHOR_EMAIL=$GIT_EMAIL
    export GIT_COMMITTER_NAME=$GIT_USERNAME
    export GIT_COMMITTER_EMAIL=$GIT_EMAIL
}
