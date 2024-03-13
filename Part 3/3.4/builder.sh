#!/bin/sh

# Terminate script if args are less than 2 & echo usage
if (( $# < 2 )); then
    echo -e "\nPlease call '$0 <git-repo-name> & <docker-repo-name>' to run this script!\n"
    echo "Usage: './builder.sh mluukkai/express_app mluukkai/testing'"
    exit 2
fi

# Extract git repo name
git_repo=${1##*/}
# If found, remove and clone again
if [ -d "$git_repo" ]; then
    echo "Found directory $git_repo. Deleting ..."
    rm -Rf $git_repo;
fi
echo "Cloning Git repo $1"
git clone "https://github.com/$1.git"

# Build docker image
echo "Building Docker image $2"
docker build -t $2 $git_repo

# Login to docker
echo "Logging into Docker Hub"
echo "$DOCKER_PASS" | docker login --username $DOCKER_USER --password-stdin

# Push to docker hub
echo "Pushing image to docker hub"
docker push "$2"

exit 0

# $ docker build -t builder .
# $ docker run -e DOCKER_USER=<docker-username> -e DOCKER_PWD=<docker-password> -v //var/run/docker.sock:/var/run/docker.sock builder mluukkai/express_app mluukkai/testing2