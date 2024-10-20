# jenkins-init
Setting up Jenkins CI/CD pipeline

## Prerequisites

- Terraform installed
- AWS CLI configured
- A valid AWS Key Pair (for SSH access)

## Usage

1. **Clone the repository**:

    ```bash
    git clone https://github.com/fakhriperdana/jenkins-init.git
    cd jenkins-init/terraform
    ```

2. **Initialize Terraform**:

    Initialize the Terraform working directory:

    ```bash
    terraform init
    ```

3. **Apply the Terraform Configuration**:

    Apply the Terraform configuration to provision the EC2 instance:

    ```bash
    terraform apply
    ```

    You will be prompted to confirm. Type `yes` to proceed.

4. **Access Jenkins**:

    Once the EC2 instance is created, the public IP address of the Jenkins server will be displayed in the Terraform output. Use this IP to access Jenkins:

    ```bash
    http://<public_ip>:8080
    ```

5. **Unlock Jenkins**:

    SSH into the instance to retrieve the Jenkins admin password:

    ```bash
    ssh -i /path/to/your-key.pem ubuntu@<public_ip>
    sudo cat /var/lib/jenkins/secrets/initialAdminPassword
    ```

    Copy the password, paste it into the Jenkins web interface, and follow the setup instructions.

6. **Set up Jenkins**:

    - Install the recommended plugins.
    - Create an admin user.

## Cleanup

To destroy the infrastructure and avoid charges on your AWS account, run:

```bash
terraform destroy
