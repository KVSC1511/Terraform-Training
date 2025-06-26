# Terraform & AWS CLI Installation

## Step-01: Introduction
- Install Terraform CLI
- Install AWS CLI
- Install VS Code Editor
- Install HashiCorp Terraform plugin for VS Code


## Step-02: MACOS: Terraform Install

Method-1

- [Download Terraform MAC](https://developer.hashicorp.com/terraform/install)
- [Install CLI](https://learn.hashicorp.com/tutorials/terraform/install-cli)
- Unzip the package
```
# Copy binary zip file to a folder
COPY Package to "terraform-install" folder

# Unzip
unzip <PACKAGE-NAME>
unzip terraform_0.14.3_darwin_amd64.zip

# Copy terraform binary to /usr/local/bin
echo $PATH
mv terraform /usr/local/bin

# Verify Version
terraform version

# To Uninstall Terraform (NOT REQUIRED)
rm -rf /usr/local/bin/terraform
``` 

Method-2

```
# Install in MACOS with Brew

brew tap hashicorp/tap
brew install hashicorp/tap/terraform


```

## Step-03: MACOS: IDE for Terraform - VS Code Editor
- [Microsoft Visual Studio Code Editor](https://code.visualstudio.com/download)
- [Hashicorp Terraform Plugin for VS Code](https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform)



### Step-04: MACOS: Install AWS CLI
- [AWS CLI Install](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html#getting-started-install-instructions)
- [Install AWS CLI - MAC](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html#getting-started-install-instructions)

```
# Install AWS CLI V2
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /
which aws
aws --version

# Uninstall AWS CLI V2 (NOT REQUIRED)
which aws
ls -l /usr/local/bin/aws
sudo rm /usr/local/bin/aws
sudo rm /usr/local/bin/aws_completer
sudo rm -rf /usr/local/aws-cli
```


## Step-05: MACOS: Configure AWS Credentials 

- **Pre-requisite:** Should have AWS Account.
  - [Create an AWS Account](https://portal.aws.amazon.com/billing/signup?nc2=h_ct&src=header_signup&redirect_url=https%3A%2F%2Faws.amazon.com%2Fregistration-confirmation#/start)
- Generate Security Credentials using AWS Management Console
  - Go to Services -> IAM -> Users -> "Your-Admin-User" -> Security Credentials -> Create Access Key
- Configure AWS credentials using SSH Terminal on your local desktop

```
# Configure AWS Credentials in command line
$ aws configure
AWS Access Key ID [None]: AKIASUF7DEFKSIAWMZ7K
AWS Secret Access Key [None]: WL9G9Tl8lGm7w9t7B3NEDny1+w3N/K5F3HWtdFH/
Default region name [None]: us-east-1
Default output format [None]: json

# Verify if we are able list S3 buckets
aws s3 ls
```
- Verify the AWS Credentials Profile
```
cat $HOME/.aws/credentials 
```

## Step-06: WindowsOS: Terraform & AWS CLI Install
- [Download Terraform](https://www.terraform.io/downloads.html)
## Terraform Installation – Windows Setup Guide

Follow these steps to install and configure Terraform CLI on a Windows machine.

### Step 6.1: Download Terraform
- Visit the official Terraform download page:  
  [https://developer.hashicorp.com/terraform/downloads](https://developer.hashicorp.com/terraform/downloads)
- Under **Windows (64-bit)**, click **Download ZIP**

---

### Step 6.2: Extract the Terraform Executable
- After downloading, right-click the ZIP file → **Extract All**
- You will get a single file: `terraform.exe`

---

### Step 6.3: Create a Directory for Terraform Binaries
- Open `C:\Users\<YourUsername>\`
- Create a folder named: `terraform-bins`
- Move the extracted `terraform.exe` into this folder

---

### Step 6.4: Add Terraform to System PATH

1. Press `Win + S` and search for **Environment Variables**  
    Open **"Edit the system environment variables"**

2. Click **Environment Variables**

3. Under **User Variables**, select `Path` → click **Edit**

4. Click **New** and paste this path (replace `<YourUsername>`):

5. Click **OK**, then again **OK** to apply and close all dialogs

---

### Step 6.5: Verify the Installation
Open **Command Prompt** or **PowerShell**, and run:
```bash
terraform version


```

### Step 6.6: Install AWS CLI V2 – Windows

Follow these steps to install and configure AWS CLI v2 on a Windows machine.

#### Step 1: Download the Installer
- Visit the official page:  
  [https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-windows.html](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-windows.html)

- Click **"Windows (64-bit)" Installer** to download the `.msi` file.

---

#### Step 2: Run the Installer
- Double-click the downloaded `.msi` file and follow the installation wizard.
- Accept the license, keep default settings, and complete the setup.

---

#### Step 3: Verify Installation
Open **Command Prompt** or **PowerShell**, and run:
```bash
aws --version

```

### Step 6.6: Configure and Test AWS CLI – Windows

#### Configure AWS Credentials

Use the following command in **Command Prompt** or **PowerShell** to set up your AWS credentials:

```bash
aws configure
```

### You will be prompted to enter:

- AWS Access Key ID
- AWS Secret Access Key
- Default Region Name (e.g., us-east-1)
- Default Output Format (e.g., json or leave blank)

Example:
```
AWS Access Key ID [None]: AKIAXXXXXXXX
AWS Secret Access Key [None]: abc123/xxxxxxxxxxxxxx
Default region name [None]: us-east-1
Default output format [None]: json
```
#### Test AWS CLI

```
aws s3 ls

```



