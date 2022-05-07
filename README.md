# aws-sam-cli-docker
Use [SAM CLI](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/what-is-sam.html) from docker. 
Build corresponding image and add alias to make it available system-wide:
> **Windows (powershell):** Open powershell profile with `notepad $profile`.

> **Linux:** Adjust `~/.bashrc` or `~/.bash_aliases`  

## cfn-lint
`
docker build -t cfn-lint:latest -f Cfn.Dockerfile . 
`

Make `cfn-lint` available in 

### *PowerShell*
 ```powershell
 Function CFNLINT { docker run --rm -it -v ${pwd}:/lint cfn-lint:latest cfn-lint $args }
 Set-Alias -Name cfn-lint -Value CFNLINT
 ```

### *Linux*
```sh
alias cfn-lint='docker run --rm -it -v $(pwd):/lint cfn-lint:latest cfn-lint'
```

## sam (dotnet)

`
docker build -t sam-dotnet:v1 -f DotNet.Dockerfile . 
`

Make `sam-dotnet` available in 

### *PowerShell*
```powershell
Function SAMDOTNET { docker run --rm -it -v $env:userprofile\\.aws:/root/.aws -v ${pwd}:/sam sam-dotnet:v1 sam $args }
Set-Alias -Name sam-dotnet -Value SAMDOTNET
```

### *Linux*
```sh
alias sam-dotnet='docker run --rm -it -v ~/.aws:/root/.aws -v $(pwd):/sam sam-dotnet:v2 sam'
```

