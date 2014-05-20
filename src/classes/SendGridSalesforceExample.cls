public with sharing class SendGridSalesforceExample {
	public SendGridSalesforceExample() {
		SendGrid sendgrid = new SendGrid('username', 'password');

		SendGrid.email email = new SendGrid.Email();
		email.addTo('salesforce@mailinator.com');
		email.setFrom('salesforce@mailinator.com');
		email.setSubject('[sendgrid-salesforce-example] Owl named %yourname%');
		email.setText('Owl are you doing?');
		email.setHtml('<strong>%how% are you doing?</strong>');

    String response = sendgrid.send(email);

    System.debug(response);
	}
}