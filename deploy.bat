call bundle exec middleman build
xcopy build\*.* ..\docs.avatarapi.com /s /Y
cd ..\docs.avatarapi.com 
git add --all
git commit -m "deploy"
git push
cd 
cd ..\avatarapi-docs