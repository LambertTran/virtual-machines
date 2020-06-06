// Requirements:
+ jq

// Build:
```
packer build -var "subnet=<subnet ID>" <name of packer>.json
```

**Note**: need to cd into folder

#### KMS
**Note**:
+ To use KMS, need permission
+ user needs to be attached to Key
```json
{
    "Version": "2012-10-17",
    "Statement": {
        "Effect": "Allow",
        "Action": [
            "kms:ReEncrypt*",
            "kms:GenerateDataKey*",
            "kms:Encrypt",
            "kms:Decrypt",
            "kms:DescribeKey",
            "kms:PutKeyPolicy"
        ],
        "Resource": "*"
    }
}
```
