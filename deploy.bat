call bundle exec middleman build --verbose
xcopy build\*.* ..\docs.avatarapi.com /s /Y
cd ..\docs.avatarapi.com 
git add --all
git commit -m "deploy"
git push
cd 
cd ..\avatarapi-docs