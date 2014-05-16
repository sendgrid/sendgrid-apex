# sendgrid-salesforce

This Apex library allows you to quickly and easily send emails through SendGrid using Salesforce Apex.

## Usage

To begin using this library, initialize the SendGrid object with your SendGrid credentials.

```java
code
```

Add your message details.

```java
code
```

Send it.

## Development

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

![](https://raw.githubusercontent.com/scottmotte/apex-hello-world/master/apex-hello-world-1.png)

On the next window, click "Install Plugin". This installs the Mavens Mate plugin into Sublime Text 3.

Close and reopen Sublime Text 3.

Click Mavens Mate > Settings > User at the top Sublime Text 3 Toolbar.

![](https://raw.githubusercontent.com/scottmotte/apex-hello-world/master/apex-hello-world-2.png)

This will open a file called `mavensmate.sublime-settings`. Paste the following in that file. Adjust to the path and directory you want to store your salesforce code in.

```json
{
  "mm_workspace": "/Users/scottmotte/code/salesforce"
}
```

Save and close that file.

### Open the project

With Sublime Text 3 still open, click Mavens Mate > Project > Open Project

