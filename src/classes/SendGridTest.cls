@isTest
private class SendGridTest {

  private static final String USERNAME = 'username';
  private static final String PASSWORD = 'password';

  @isTest static void testInitialize() {
    SendGrid sendgrid = new SendGrid(USERNAME, PASSWORD);
  }

  @isTest static void testAddTo() {
    SendGrid sendgrid = new SendGrid(USERNAME, PASSWORD);
    SendGrid.Email email = new SendGrid.Email();

    String address = 'email@example.com';
    email.addTo(address);
  }
}