@isTest
private class SendGridTest {

  private static final String USERNAME = 'username';
  private static final String PASSWORD = 'password';

  @isTest static void testInitialize() {
    SendGrid sendgrid = new SendGrid(USERNAME, PASSWORD);
  }

  @isTest static void testAddTo() {
    SendGrid sendgrid = new SendGrid(USERNAME, PASSWORD);

    String email = 'email@example.com';
    sendgrid.addTo(email);

    List<string> emails = new List<String> { email };
    system.assertEquals(sendgrid.getTos(), emails);
  }
}