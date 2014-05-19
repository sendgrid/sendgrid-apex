# sendgrid-salesforce

This Apex library allows you to quickly and easily send emails through SendGrid using Salesforce Apex.

## Usage

To begin using this library, initialize the SendGrid object with your SendGrid credentials.

<https://login.salesforce.com/packaging/installPackage.apexp?p0=04tF0000000KeAR>

```java
code
```

Add your message details.

```java
code
```

Send it.

## Development

Getting your development environment setup to code on this project is difficult. The following explains how.

### Setup Salesforce.com

[Create a salesforce.com developer account](https://developer.salesforce.com/signup).

You'll receive an email from Salesforce with a link to confirm. Click it.

On the next screen, set your password. Yeah, it's an odd flow, but it's salesforce so what do you expect.

You now have a developer account.

Generate your security token. We will need this later. While logged into your developer account, click "Your Name > My Settings" at the top right portion of your developer account dashboard.

Then on the left side of the screen click "Personal > Reset My Security Token". Click the "Reset Security Token" button. Salesforce emails you a security token. You will need this later.

### Setup local environment

[Install Sublime Text 3](http://www.sublimetext.com/3).

[Install Mavens Mate](http://mavensmate.com/).

Open up Sublime Text 3, and then open up Mavens Mate on your machine. There should be a Mavens Mate icon, at the top bar of your screen. Click it and then click "Plugins".

On the next window, click "Install Plugin". This installs the Mavens Mate plugin into Sublime Text 3.

Close and reopen Sublime Text 3.

Click Mavens Mate > Settings > User at the top Sublime Text 3 Toolbar.

This will open a file called `mavensmate.sublime-settings`. Paste the following in that file. Adjust to the path and directory you want to store your salesforce code in. It must be an absolute path.

```json
{
  "mm_workspace": "/Users/your_username/code/salesforce"
}
```

Save and close that file.

### Clone the repo

```
cd /Users/your_username/code/salesforce
git clone https://github.com/scottmotte/sendgrid-salesforce.git
```
### Open the project

With Sublime Text 3 still open, click "File > Open", and open the sendgrid-salesforce folder.

### Create the project on Salesforce

Right click on the sendgrid-salesforce containing folder, and choose "MavensMate > Create MavensMate Project".

On the next screen enter the following:

* For project name: 'sendgrid-salesforce' 
* For username: enter your email address
* For password: enter your password APPENDED with your salesforce security token. (see above for how to generate the security token) 

When you're ready click the 'Create Project' button.

This will create the project up on Salesforce.com and locally on your machine. That's what we want.

Next, the final and most important step.

Click "Mavens Mate > Project > Compile Project".

### You're done

You're done!

Now go ahead and develop. I recommend [this tutorial](https://github.com/scottmotte/apex-hello-world) or [this blog post](http://sendgrid.com/blog/hello-world-apex/) for learning some basics of developing with Apex.


