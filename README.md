# KaliLinux-tf-conf-AWS
The configuration files to launch a custom Kali box is hosted in this repo.

First, edit the kali_vars.tf to supply your unique variables.

Comment out the backend configuration if you use local backend

Enter your bucket name in the iam policy section of the kali_iam.tf file, or comment entire file out if it does not apply to your use case

You can add any number of packages in the kaliconf.sh file, either through apt, pip install or clone - all before you apply.

You can access your box with any RDP client, using instance public DNS

Username: kali

Password: kali

Once you login, run the command below;

$ sudo dpkg-reconfigure wireshark-common

Choose 'YES' in the interactive question that follows. 

And that's all. The Kali Box is ready for use.
