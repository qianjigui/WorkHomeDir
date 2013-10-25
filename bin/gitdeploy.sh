#!/bin/bash
#Author: wpc

if [ $# != 3 ]
then
    echo '  Usage:'
    echo "    $0 <git-dir> <git-commit> <deploy-directory>"
    exit 1
fi

DIR=$1
TAG=$2
DEPLOY_DIR=$3
TAR_NAME="deploy-$TAG.tar"
TAR_NAME=${TAR_NAME//\//_} #Replace string names' / to _
#REPO_URL=xxx

cd $DIR
echo 'Remove old files...'
rm $TAR_NAME
echo "Git Archive from url=$REPO_URL tag=$TAG"
#git archive --format=tar --output=$TAR_NAME --remote=$REPO_URL $TAG
git archive --format=tar --output=$TAR_NAME $TAG
cd -

echo 'Deploy......'

echo 'Check git log...'
cd $DEPLOY_DIR
git log -1

cd -

echo "rm -rf $DEPLOY_DIR/* ?"
echo '...... y/n [n]'
read toDel
case "$toDel" in
    'y' )
        echo 'removing...'
        rm -rf $DEPLOY_DIR/*
    ;;
esac

echo "Unpack $TAR_NAME to $DEPLOY_DIR..."
tar xf $DIR/$TAR_NAME -C $DEPLOY_DIR

echo 'Finish.'
echo 'Commit Message Template:'
echo '########################'
echo 'Sync from:'
echo "  git-tag: $TAG"
echo '########################'
