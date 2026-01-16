Import-Module AWS.Tools.Common
Import-Module AWS.Tools.S3

Set-DefaultAWSRegion -Region us-east-1

$bucketName = Read-Host -Prompt 'Enter the S3 bucket name'

function BucketExists {
    param ($bucketName)
    try {
        Get-S3BucketLocation -BucketName $bucketName -ErrorAction Stop | Out-Null
        return $true
    } catch {
        return $false
    }
}

if (-not (BucketExists $bucketName)) {
    New-S3Bucket -BucketName $bucketName -Region us-east-1 -ErrorAction Stop
    Write-Host "Bucket $bucketName created."
} else {
    Write-Host "Bucket $bucketName already exists."
}

$fileName = "sample.txt"
"Hello, S3!" | Set-Content -Path $fileName

Write-S3Object `
    -BucketName $bucketName `
    -File $fileName `
    -Key $fileName `
    -ErrorAction Stop

Write-Host "File $fileName uploaded to bucket $bucketName."

Remove-Item $fileName
