---
title: "Deep Learning Notebook AMI"
bigTitle: "Instructions"
---

{{< figure src="images/1.png" class="ml-4 float-right border border-dark" width=550 >}}
### 1. Launch the AMI

You can access the AMI listing page either from the AWS marketplace url or directly from the EC2 Console in the AWS Marketplace category.

On the marketplace AMI page, click on **"Continue to Subscribe"** and Accept to enable the AMI for your account. Note that subscribing does not incur charges on your account. It simply allows you to access the AMI.


### 2. Access to the AMI is now enabled for your account
 
You will get a confirmation and after a short period the product will be enabled for your account  


{{< figure src="images/2.png" class="ml-4 float-right border border-dark" width=550 >}}
### 3. Launch a new instance of the AMI

Select the region, vpc and your key pair settings. The configured security group has ports `tcp/8888` (jupyter notebook) and `tcp/22` (ssh) open by default.

When selecting the EC2 instance type, if you select a `p2.*` or `p3.*` instance, those come with GPUs, and the AMI will automatically configure the required drivers and packages to enable Tensorflow and Pytorch to take advantage of the GPU acceleration.

For more information on how to configure EC2 instances, refer to the [Amazon documentation](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/launching-instance.html)

### (Optional) Enable S3 and/or custom SSL certificates

**This step is optional.** 

The AMI supports custom configuration enabled by changing the instance's `user data` at launch time.

When configuring the launch settings, look for the **User Data section**. You can set user data when configuring the instance to enable the following options:

- **S3 Access:** If you wish to persist your notebooks to long-term storage, you can use [Amazon S3](https://aws.amazon.com/s3/?hp=tile&so-exp=below) as storage backend for Jupyter
  - When configuring the launch, add this line to the user-data field: `S3_BUCKET=your-s3-bucket-name`
  - You also need to assign an [IAM role](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/iam-roles-for-amazon-ec2.html) with S3 permissions to your instance.
  - The instance will then mount the S3 bucket as the notebook directory during boot. Notebooks will be saved and loaded from the S3 bucket. 
  - This is useful to persist your notebooks as otherwise the AMI data is lost when terminating the instance.

<!-- - **SSL Certificate:** Use a custom SSL certificate (to avoid the ERR_CERT_AUTHORITY_INVALID warning)
  - You can use your own SSL certificates for the instance. See [How to Enable SSL for your Website](https://support.microsoft.com/en-us/help/298805/how-to-enable-ssl-for-all-customers-who-interact-with-your-web-site-in)
  - Upload your certificate and private key to S3
Add SSL_CERT=/home/ec2-user/s3/path-to-cert.crt and SSL_KEY=/home/ec2-user/s3/path-to-cert.key to the user-data field.
This will let the instance load the certificate and private key.
This can be useful if you don't want to use a self-signed certificate for the web server. -->
 
{{< figure src="images/3.png" class="ml-4 float-right border border-dark" width=550 >}}
### 4. Connect to Jupyter

After launching the instance, open the ec2 console to find out the IP address and the instance id (the instance id is the password in the jupyter login screen)
- Note the ip address of the instance (`instance-ip`)
- Note the instance id (ex `i-1edca67e90cbhdef0`). **This is your Jupyter password to log in to your instance**
- Browse to `https://<instance-ip>:8888` (replace `<instance-ip>` with your instance's ip. ex: 102.52.12.44)

### 5. Accept the SSL certificate warning
You should see an SSL certificate warning.

The AMI generates a self-signed SSL certificate in order to encrypt traffic between your browser and the Jupyter server. Because the certificate is **self-signed** and was not certified by a **Certificate Authority (CA)**, your browser will show a warning. 

Click `Advanced` and accept the security exception to continue.

{{< figure src="images/4.png" class="ml-4 float-right border border-dark" width=550 >}}
### 6. Log in to Jupyter

You should see the Jupyter Log in screen.

Use **your instance id** as the Jupyter password to log in. You can find your instance id in the EC2 console.


### 7. Start coding

You should now be in the Jupyter environment. You can create a new notebook and start coding

If you still need help, please contact [support@sigmodata.com](mailto:support@sigmodata.com)