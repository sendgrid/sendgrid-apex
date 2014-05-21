# sendgrid-apex

This Apex Toolkit allows you to quickly and easily send emails through [SendGrid](http://sendgrid.com) using [Salesforce Apex](https://developer.salesforce.com/page/Apex).

```java
SendGrid sendgrid = new SendGrid('username', 'password');

SendGrid.email email = new SendGrid.Email();
email.addTo('foo@bar.com');
email.setFrom('me@bar.com');
email.setSubject('Subject goes here');
email.setText('Hello World!');

String response = sendgrid.send(email);
```

## Installation

To start using the SendGrid Apex Toolkit in your Salesforce Org, install the unmanaged package of the library with the following URL:

<https://login.salesforce.com/packaging/installPackage.apexp?p0=04tF0000000KeAR>

Click Continue -> Next -> Next -> Install.

## Usage

To begin using this library, initialize the SendGrid object with your SendGrid credentials.


```java
SendGrid sendgrid = new SendGrid('username', 'password');
```

Add your message details.

```java
SendGrid.email email = new SendGrid.Email();
email.addTo('foo@bar.com');
email.setFrom('me@bar.com');
email.setSubject('Subject goes here');
email.setText('Hello World!');
email.setHtml('<strong>Hello World!</strong>');
```

Send it.

```
String response = sendgrid.send(email);
```

### addTo

```
SendGrid.email email = new SendGrid.Email();
email.addTo('email@example.com');
email.addTo('email2@example.com');
```

### setTos

```
SendGrid.email email = new SendGrid.Email();
List<String> tos = new List<String> { 'setTos@mailinator.com' };
email.setTos(tos);
```

### setFrom

```
SendGrid.email email = new SendGrid.Email();
email.setFrom('foo@bar.com');
```

### setFromName

```
SendGrid.email email = new SendGrid.Email();
email.setFromName('Example Lady');
```

### setReplyTo

```
SendGrid.email email = new SendGrid.Email();
email.setReplyTo('foo@bar.com');
```

### Bcc

Use multiple `addTo`s as a superior alternative to `setBcc`.

```
SendGrid.email email = new SendGrid.Email();
email.addTo('foo@bar.com');
email.addTo('someotheraddress@bar.com');
email.addTo('another@another.com');
...
```

But if you do still have a need for Bcc you can do the following.

```
SendGrid.email email = new SendGrid.Email();
email.addBcc('foo@bar.com');
```

### setSubject

```
SendGrid.email email = new SendGrid.Email();
email.setSubject('This is a subject');
```

### setText

```
SendGrid.email email = new SendGrid.Email();
email.setText('This is some text');
```

### setHtml

```
SendGrid.email email = new SendGrid.Email();
email.setHtml('<h1>This is an html email</h1>');
```

### addSubstitution

```
SendGrid.email email = new SendGrid.Email();
List<String> vals = new List<String> { 'val' };
email.addSubstitution('sub', vals);
```

### addUniqueArg

```
SendGrid.email email = new SendGrid.Email();
email.addUniqueArg('add_unique_argument_key', 'add_unique_argument_value');
```

### addCategory

```
SendGrid.email email = new SendGrid.Email();
email.addCategory('Category 1');
email.addCategory('Category 2');
```

### addSection

```
SendGrid.email email = new SendGrid.Email();
email.addSection('set_section_key', 'set_section_value');
```

### addFilter

```
SendGrid.email email = new SendGrid.Email();
email.addFtiler('footer', 'text/html', '<strong>boo</strong>');
```

### Headers

You can add standard email message headers as necessary.

```
SendGrid.email email = new SendGrid.Email();
email.addTo('foo@bar.com');
...
email.addHeader('X-Sent-Using', 'SendGrid-API');
email.addHeader('X-Transport', 'web');
```

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
git clone https://github.com/scottmotte/sendgrid-apex.git
```
### Open the project

With Sublime Text 3 still open, click "File > Open", and open the sendgrid-apex folder.

### Create the project on Salesforce

Right click on the sendgrid-apex containing folder, and choose "MavensMate > Create MavensMate Project".

On the next screen enter the following:

* For project name: 'sendgrid-apex' 
* For username: enter your email address
* For password: enter your password APPENDED with your salesforce security token. (see above for how to generate the security token) 

When you're ready click the 'Create Project' button.

This will create the project up on Salesforce.com and locally on your machine. That's what we want.

Next, the final and most important step.

Click "Mavens Mate > Project > Compile Project".

### You're done

You're done!

Now go ahead and develop. I recommend [this tutorial](https://github.com/scottmotte/apex-hello-world) or [this blog post](http://sendgrid.com/blog/hello-world-apex/) for learning some basics of developing with Apex.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
