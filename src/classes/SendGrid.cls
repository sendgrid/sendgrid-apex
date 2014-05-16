global class SendGrid {
  private String username;
  private String password;
  private List<string> tos = new List<String>();

  public SendGrid(String username, String password) {
    this.username = username;
    this.password = password;
  }

  global class Email {
    public String to;
    public Smtpapi.Header smtpapi;

    public Email() {
      this.smtpapi = new Smtpapi.Header();
    }

    public Email addTo(String email) {
      this.smtpapi.addTo(email);
      return this;
    }
  }

  public SendGrid addTo(String email) {
    this.tos.add(email);
    return this;
  }

  public List<string> getTos() {
    return this.tos;
  }
}