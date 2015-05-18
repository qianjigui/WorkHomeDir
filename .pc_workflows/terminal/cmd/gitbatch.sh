
#A31S functions
a31branchsyncfromdev2() {
    git fetch yunos && git merge --no-ff yunos/allwinner/a31/4.4/dev2 && git commit --amend -m "A31S Sync from dev2 branch"
}

a31StableDevDiff() {
    git fetch yunos && git diff --name-only yunos/allwinner/a31/4.4/stable2x yunos/allwinner/a31/4.4/dev2
}

