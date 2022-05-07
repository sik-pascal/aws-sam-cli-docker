# aws-sam-cli-docker
Use SAM CLI from docker

## cfn-lint
Build image with

`
docker build -t cfn-lint:latest -f Dockerfile.Cfn . 
`

### Windows
Set alias: open powershell profile with `notepad $profile` and add:

```powershell
Function CFNLINT { docker run --rm -it -v ${pwd}:/lint cfn-lint:latest cfn-lint $args }
Set-Alias -Name cfn-lint -Value CFNLINT
```

## sam-cli (dotnet)
Build image with

`
docker build -t sam-dotnet:latest -f Dockerfile.DotNet . 
`

### Windows
Set alias: open powershell profile with `notepad $profile` and add:

```powershell
Function SAMDOTNET { docker run --rm -it -v $env:userprofile\\.aws:/root/.aws -v ${pwd}:/sam-dotnet sam-dotnet:latest sam $args }
Set-Alias -Name sam-dotnet -Value SAMDOTNET
```
