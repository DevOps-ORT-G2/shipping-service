#!/bin/bash

git init 
git add . 
git commit -m "Commit inicial"

# creo branches
git branch staging | git branch qa | git branch develop

#login a github y creo repo
gh auth login --hostname github.com -p ssh --with-token < .token
gh repo create DevOps-ORT-G2/${PWD##*/} --private --source=. --push
gh auth logout

# pusheo las ramas estables al repo remoto
git checkout staging | git push --set-upstream origin staging
git checkout qa | git push --set-upstream origin qa
git checkout develop | git push --set-upstream origin develop