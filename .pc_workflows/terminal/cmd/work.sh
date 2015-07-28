export A20='/SSHFS/pengcheng.wang/projs/tvs/Openbase/A20/2.xUserDebug'
export A31='/SSHFS/pengcheng.wang/projs/tvs/Openbase/A31S4.4/YOS2/EngVersion'
export L='/SSHFS/pengcheng.wang/projs/tvs/Openbase/rockchip/L'

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
