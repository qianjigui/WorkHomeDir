
#A31S functions
a31branchsyncfromdev2() {
    git fetch yunos && git merge --no-ff yunos/allwinner/a31/4.4/dev2 && git commit --amend -m "A31S Sync from dev2 branch"
}

a31StableDevDiff() {
    git fetch yunos && git diff --name-only yunos/allwinner/a31/4.4/stable2x yunos/allwinner/a31/4.4/dev2
}

opencodesubmit() {
    ruby $PCWF/terminal/cmd/pengcheng.wang_submit.rb 29418 pengcheng.wang@opencode.alibaba-inc.com
}

tvcodesubmit() {
    ruby $PCWF/terminal/cmd/pengcheng.wang_submit.rb 29418 pengcheng.wang@tvcode.alibaba-inc.com
}

gerritsubmit() {
    opencodesubmit && tvcodesubmit
}

gitpushforreview() {
    ruby $PCWF/terminal/cmd/gitpushforreview.rb
}

githubconfig() {
    GIT_USERNAME=qianjigui
    GIT_EMAIL=qianjigui@gmail.com
    git config user.name $GIT_USERNAME
    git config user.email $GIT_EMAIL

    export GIT_AUTHOR_NAME=$GIT_USERNAME
    export GIT_AUTHOR_GIT_EMAIL=$GIT_EMAIL
    export GIT_COMMITTER_NAME=$GIT_USERNAME
    export GIT_COMMITTER_GIT_EMAIL=$GIT_EMAIL
}
