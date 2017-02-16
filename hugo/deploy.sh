#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
hugo -t hugo-universal-theme # if using a theme, replace by `hugo -t <yourtheme>`
echo -e 'building...'

# copy contents of public to github repo
cp -r public/. learnroboticsclass.github.io/
echo -e 'copying...'

# Go To Public folder
cd learnroboticsclass.github.io

# Add changes to git.
git add --all
echo -e 'adding...'

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

echo -e 'committing...'

# Push source and build repos.
git push origin master

echo 'site is deployed!'

# Come Back
cd ..